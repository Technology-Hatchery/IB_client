package com.tws.samples.Java.apidemo.panels.resources;

/**
 * Created by Alfred on 8/11/2014.
 */

import javax.swing.*;
import javax.swing.table.AbstractTableModel;
import javax.swing.table.TableCellRenderer;

/**
 * Table where first n columsn are left-justified, all other columns are right-justified.
 */
public class Table extends JTable {
    private int m_n;

    public Table(AbstractTableModel model) {
        this(model, 1);
    }

    public Table(AbstractTableModel model, int n) {
        super(model);
        m_n = n;
    }

    @Override
    public TableCellRenderer getCellRenderer(int row, int col) {
        TableCellRenderer rend = super.getCellRenderer(row, col);
        ((JLabel) rend).setHorizontalAlignment(col < m_n ? SwingConstants.LEFT : SwingConstants.RIGHT);
        return rend;
    }
}
