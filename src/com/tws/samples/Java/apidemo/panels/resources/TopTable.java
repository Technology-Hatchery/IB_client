package com.tws.samples.Java.apidemo.panels.resources;

import com.tws.samples.Java.apidemo.panels.TopResultsPanel;

import javax.swing.*;
import javax.swing.table.TableCellRenderer;

/**
 * Created by Alfred on 8/12/2014.
 */
public class TopTable extends JTable {
    public TopTable(TopModel model) {
        super(model);
    }

    @Override
    public TableCellRenderer getCellRenderer(int rowIn, int column) {
        TableCellRenderer rend = super.getCellRenderer(rowIn, column);
        TopResultsPanel.m_model.color(rend, rowIn, getForeground());
        return rend;
    }
}
