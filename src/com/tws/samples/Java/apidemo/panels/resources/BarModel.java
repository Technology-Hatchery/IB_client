package com.tws.samples.Java.apidemo.panels.resources;

import com.ib.controller.Bar;
import com.tws.samples.Java.apidemo.panels.BarResultsPanel;

import javax.swing.table.AbstractTableModel;
import java.util.ArrayList;

/**
 * Created by Alfred on 8/12/2014.
 */
public class BarModel extends AbstractTableModel {
    public final ArrayList<Bar> m_rows = new ArrayList<>();

    @Override
    public int getRowCount() {
        return m_rows.size();
    }

    @Override
    public int getColumnCount() {
        return 7;
    }

    @Override
    public String getColumnName(int col) {
        switch (col) {
            case 0:
                return "Date/time";
            case 1:
                return "Open";
            case 2:
                return "High";
            case 3:
                return "Low";
            case 4:
                return "Close";
            case 5:
                return "Volume";
            case 6:
                return "WAP";
            default:
                return null;
        }
    }

    @Override
    public Object getValueAt(int rowIn, int col) {
        Bar row = m_rows.get(rowIn);
        switch (col) {
            case 0:
                return row.formattedTime();
            case 1:
                return row.open();
            case 2:
                return row.high();
            case 3:
                return row.low();
            case 4:
                return row.close();
            case 5:
                return row.volume();
            case 6:
                return row.wap();
            default:
                return null;
        }
    }
}
