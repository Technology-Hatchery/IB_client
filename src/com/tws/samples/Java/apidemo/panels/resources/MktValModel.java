package com.tws.samples.Java.apidemo.panels.resources;

import com.ib.controller.MarketValueTag;
import com.tws.samples.Java.apidemo.panels.AccountInfoPanel;

import javax.swing.table.AbstractTableModel;
import java.util.ArrayList;
import java.util.HashMap;

/**
 * Created by Alfred on 8/11/2014.
 */
public class MktValModel extends AbstractTableModel {
    private HashMap<String, MktValRow> m_map = new HashMap<String, MktValRow>();
    private ArrayList<MktValRow> m_list = new ArrayList<MktValRow>();

    public void handle(String account, String currency, MarketValueTag mvTag, String value) {
        String key = account + currency;
        MktValRow row = m_map.get(key);
        if (row == null) {
            row = new MktValRow(account, currency);
            m_map.put(key, row);
            m_list.add(row);
        }
        row.set(mvTag, value);
        fireTableDataChanged();
    }

    public void clear() {
        m_map.clear();
        m_list.clear();
        fireTableDataChanged();
    }

    @Override
    public int getRowCount() {
        return m_list.size();
    }

    @Override
    public int getColumnCount() {
        return MarketValueTag.values().length + 2;
    }

    @Override
    public String getColumnName(int col) {
        switch (col) {
            case 0:
                return "Account";
            case 1:
                return "Currency";
            default:
                return MarketValueTag.get(col - 2).toString();
        }
    }

    @Override
    public Object getValueAt(int rowIn, int col) {
        MktValRow row = m_list.get(rowIn);
        switch (col) {
            case 0:
                return row.m_account;
            case 1:
                return row.m_currency;
            default:
                return AccountInfoPanel.format(row.get(MarketValueTag.get(col - 2)), null);
        }
    }
}
