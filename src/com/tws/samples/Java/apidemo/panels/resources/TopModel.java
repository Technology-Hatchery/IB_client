/* Copyright (C) 2013 Interactive Brokers LLC. All rights reserved.  This code is subject to the terms
 * and conditions of the IB API Non-Commercial License or the IB API Commercial License, as applicable. */

package com.tws.samples.Java.apidemo.panels.resources;

import static com.ib.controller.Formats.fmt;
import static com.ib.controller.Formats.fmtPct;
import static com.ib.controller.Formats.*;

import java.awt.Color;
import java.util.ArrayList;

import javax.swing.JLabel;
import javax.swing.table.AbstractTableModel;
import javax.swing.table.TableCellRenderer;

import com.ib.controller.ApiController.TopMktDataAdapter;
import com.ib.controller.Formats;
import com.ib.controller.NewContract;
import com.ib.controller.NewTickType;
import com.ib.controller.Types.MktDataType;
import com.tws.samples.Java.apidemo.ApiDemo;
import com.tws.samples.Java.apidemo.panels.resources.TopRow;

public class TopModel extends AbstractTableModel {
    private ArrayList<TopRow> m_rows = new ArrayList<TopRow>();

    public void addRow(NewContract contract) {
        TopRow row = new TopRow(this, contract.description());
        m_rows.add(row);
        ApiDemo.INSTANCE.controller().reqTopMktData(contract, "", false, row);
        fireTableRowsInserted(m_rows.size() - 1, m_rows.size() - 1);
    }

    void addRow(TopRow row) {
        m_rows.add(row);
        fireTableRowsInserted(m_rows.size() - 1, m_rows.size() - 1);
    }

    public void desubscribe() {
        for (TopRow row : m_rows) {
            ApiDemo.INSTANCE.controller().cancelTopMktData(row);
        }
    }

    @Override
    public int getRowCount() {
        return m_rows.size();
    }

    @Override
    public int getColumnCount() {
        return 9;
    }

    @Override
    public String getColumnName(int col) {
        switch (col) {
            case 0:
                return "Description";
            case 1:
                return "Bid Size";
            case 2:
                return "Bid";
            case 3:
                return "Ask";
            case 4:
                return "Ask Size";
            case 5:
                return "Last";
            case 6:
                return "Time";
            case 7:
                return "Change";
            case 8:
                return "Volume";
            default:
                return null;
        }
    }

    @Override
    public Object getValueAt(int rowIn, int col) {
        TopRow row = m_rows.get(rowIn);
        switch (col) {
            case 0:
                return row.m_description;
            case 1:
                return row.m_bidSize;
            case 2:
                return fmt(row.m_bid);
            case 3:
                return fmt(row.m_ask);
            case 4:
                return row.m_askSize;
            case 5:
                return fmt(row.m_last);
            case 6:
                return fmtTime(row.m_lastTime);
            case 7:
                return row.change();
            case 8:
                return Formats.fmt0(row.m_volume);
            default:
                return null;
        }
    }

    public void color(TableCellRenderer rend, int rowIn, Color def) {
        TopRow row = m_rows.get(rowIn);
        Color c = row.m_frozen ? Color.gray : def;
        ((JLabel) rend).setForeground(c);
    }

    public void cancel(int i) {
        ApiDemo.INSTANCE.controller().cancelTopMktData(m_rows.get(i));
    }


}
