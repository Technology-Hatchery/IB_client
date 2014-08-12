package com.tws.samples.Java.apidemo.panels.resources;

import com.ib.controller.AccountSummaryTag;
import com.ib.controller.Formats;
import com.ib.interfaces.IAccountSummaryHandler;
import com.tws.samples.Java.apidemo.ApiDemo;
import com.tws.samples.Java.apidemo.panels.AccountInfoPanel;

import javax.swing.table.AbstractTableModel;
import java.util.ArrayList;
import java.util.HashMap;

/**
 * Created by Alfred on 8/11/2014.
 */
public class SummaryModel extends AbstractTableModel implements IAccountSummaryHandler {
    ArrayList<SummaryRow> m_rows = new ArrayList<SummaryRow>();
    HashMap<String, SummaryRow> m_map = new HashMap<String, SummaryRow>();
    boolean m_complete;

    public void clear() {
        ApiDemo.INSTANCE.controller().cancelAccountSummary(this);
        m_rows.clear();
        m_map.clear();
        m_complete = false;
        fireTableDataChanged();
    }

    @Override
    public void accountSummary(String account, AccountSummaryTag tag, String value, String currency) {
        SummaryRow row = m_map.get(account);
        if (row == null) {
            row = new SummaryRow();
            m_map.put(account, row);
            m_rows.add(row);
        }
        row.update(account, tag, value);

        if (m_complete) {
            fireTableDataChanged();
        }
    }

    @Override
    public void accountSummaryEnd() {
        fireTableDataChanged();
        m_complete = true;
    }

    @Override
    public int getRowCount() {
        return m_rows.size();
    }

    @Override
    public int getColumnCount() {
        return AccountSummaryTag.values().length + 1; // add one for Account column
    }

    @Override
    public String getColumnName(int col) {
        if (col == 0) {
            return "Account";
        }
        return AccountSummaryTag.values()[col - 1].toString();
    }

    @Override
    public Object getValueAt(int rowIn, int col) {
        SummaryRow row = m_rows.get(rowIn);

        if (col == 0) {
            return row.m_account;
        }

        AccountSummaryTag tag = AccountSummaryTag.values()[col - 1];
        String val = row.m_map.get(tag);

        switch (tag) {
            case Cushion:
                return fmtPct(val);
            case LookAheadNextChange:
                return fmtTime(val);
            default:
                return AccountInfoPanel.format(val, null);
        }
    }

    public String fmtPct(String val) {
        return val == null || val.length() == 0 ? null : Formats.fmtPct(Double.parseDouble(val));
    }

    public String fmtTime(String val) {
        return val == null || val.length() == 0 || val.equals("0") ? null : Formats.fmtDate(Long.parseLong(val) * 1000);
    }
}
