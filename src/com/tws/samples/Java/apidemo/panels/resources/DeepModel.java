package com.tws.samples.Java.apidemo.panels.resources;

import com.ib.controller.Types;

import javax.swing.table.AbstractTableModel;
import java.util.ArrayList;

/**
 * Created by Alfred on 8/12/2014.
 */
public class DeepModel extends AbstractTableModel {
    final ArrayList<DeepRow> m_rows = new ArrayList<DeepRow>();

    @Override
    public int getRowCount() {
        return m_rows.size();
    }

    public void updateMktDepth(int pos, String mm, Types.DeepType operation, double price, int size) {
        switch (operation) {
            case INSERT:
                m_rows.add(pos, new DeepRow(mm, price, size));
                fireTableRowsInserted(pos, pos);
                break;
            case UPDATE:
                m_rows.get(pos).update(mm, price, size);
                fireTableRowsUpdated(pos, pos);
                break;
            case DELETE:
                if (pos < m_rows.size()) {
                    m_rows.remove(pos);
                } else {
                    // this happens but seems to be harmless
                    // System.out.println( "can't remove " + pos);
                }
                fireTableRowsDeleted(pos, pos);
                break;
        }
    }

    @Override
    public int getColumnCount() {
        return 3;
    }

    @Override
    public String getColumnName(int col) {
        switch (col) {
            case 0:
                return "Mkt Maker";
            case 1:
                return "Price";
            case 2:
                return "Size";
            default:
                return null;
        }
    }

    @Override
    public Object getValueAt(int rowIn, int col) {
        DeepRow row = m_rows.get(rowIn);

        switch (col) {
            case 0:
                return row.m_mm;
            case 1:
                return row.m_price;
            case 2:
                return row.m_size;
            default:
                return null;
        }
    }
}
