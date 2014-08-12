package com.tws.samples.Java.apidemo.panels.resources;

import com.tws.samples.Java.apidemo.panels.AccountInfoPanel;

import javax.swing.*;
import javax.swing.table.AbstractTableModel;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;

/**
 * Created by Alfred on 8/11/2014.
 */
public class MarginModel extends AbstractTableModel {
    HashMap<MarginRowKey, MarginRow> m_map = new HashMap<MarginRowKey, MarginRow>();
    ArrayList<MarginRow> m_list = new ArrayList<MarginRow>();

    public void clear() {
        m_map.clear();
        m_list.clear();
    }

    public void handle(String tag, String value, String currency, String account) {
        // useless
        if (tag.equals("Currency")) {
            return;
        }

        int type = 0; // 0=whole acct; 1=securities; 2=commodities

        // "Securities" segment?
        if (tag.endsWith("-S")) {
            tag = tag.substring(0, tag.length() - 2);
            type = 1;
        }

        // "Commodities" segment?
        else if (tag.endsWith("-C")) {
            tag = tag.substring(0, tag.length() - 2);
            type = 2;
        }

        MarginRowKey key = new MarginRowKey(tag, currency);
        MarginRow row = m_map.get(key);

        if (row == null) {
            // don't add new rows with a value of zero
            if (AccountInfoPanel.isZero(value)) {
                return;
            }

            row = new MarginRow(tag, currency);
            m_map.put(key, row);
            m_list.add(row);
            Collections.sort(m_list);
        }

        switch (type) {
            case 0:
                row.m_val = value;
                break;
            case 1:
                row.m_secVal = value;
                break;
            case 2:
                row.m_comVal = value;
                break;
        }

        SwingUtilities.invokeLater(new Runnable() {
            @Override
            public void run() {
                fireTableDataChanged();
            }
        });
    }

    @Override
    public int getRowCount() {
        return m_list.size();
    }

    @Override
    public int getColumnCount() {
        return 4;
    }

    @Override
    public String getColumnName(int col) {
        switch (col) {
            case 0:
                return "Tag";
            case 1:
                return "Account Value";
            case 2:
                return "Securities Value";
            case 3:
                return "Commodities Value";
            default:
                return null;
        }
    }

    @Override
    public Object getValueAt(int rowIn, int col) {
        MarginRow row = m_list.get(rowIn);

        switch (col) {
            case 0:
                return row.m_tag;
            case 1:
                return AccountInfoPanel.format(row.m_val, row.m_currency);
            case 2:
                return AccountInfoPanel.format(row.m_secVal, row.m_currency);
            case 3:
                return AccountInfoPanel.format(row.m_comVal, row.m_currency);
            default:
                return null;
        }
    }
}
