package com.tws.samples.Java.apidemo.panels.resources;

import com.ib.controller.Alias;

import javax.swing.table.AbstractTableModel;
import java.util.ArrayList;

/**
 * Created by Alfred on 8/11/2014.
 */
public class AliasModel extends AbstractTableModel {
    ArrayList<Alias> m_list = new ArrayList<Alias>();

    @Override
    public int getRowCount() {
        return m_list.size();
    }

    public void update(ArrayList<Alias> aliases) {
        m_list.clear();
        m_list.addAll(aliases);
        fireTableDataChanged();
    }

    @Override
    public int getColumnCount() {
        return 2;
    }

    @Override
    public String getColumnName(int col) {
        switch (col) {
            case 0:
                return "Account";
            case 1:
                return "Alias";
            default:
                return null;
        }
    }

    @Override
    public Object getValueAt(int rowIn, int col) {
        Alias row = m_list.get(rowIn);
        switch (col) {
            case 0:
                return row.account();
            case 1:
                return row.alias();
            default:
                return null;
        }
    }
}
