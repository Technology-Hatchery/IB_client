package com.tws.samples.Java.apidemo.panels;

import com.ib.controller.Bar;
import com.ib.interfaces.IHistoricalDataHandler;
import com.ib.interfaces.IRealTimeBarHandler;
import com.tws.samples.Java.apidemo.ApiDemo;
import com.tws.samples.Java.apidemo.Chart;
import com.tws.samples.Java.apidemo.panels.resources.BarModel;
import com.tws.samples.Java.apidemo.util.NewTabbedPanel;

import javax.swing.*;
import javax.swing.table.AbstractTableModel;
import java.awt.*;
import java.util.ArrayList;

/**
 * Created by Alfred on 8/11/2014.
 */
public class BarResultsPanel extends NewTabbedPanel.NewTabPanel implements IHistoricalDataHandler, IRealTimeBarHandler {
    final BarModel m_model = new BarModel();
    final boolean m_historical;
    final Chart m_chart = new Chart(m_model.m_rows);

    public BarResultsPanel(boolean historical) {
        m_historical = historical;

        JTable tab = new JTable(m_model);
        JScrollPane scroll = new JScrollPane(tab) {
            public Dimension getPreferredSize() {
                Dimension d = super.getPreferredSize();
                d.width = 500;
                return d;
            }
        };

        JScrollPane chartScroll = new JScrollPane(m_chart);

        setLayout(new BorderLayout());
        add(scroll, BorderLayout.WEST);
        add(chartScroll, BorderLayout.CENTER);
    }

    /**
     * Called when the tab is first visited.
     */
    @Override
    public void activated() {
    }

    /**
     * Called when the tab is closed by clicking the X.
     */
    @Override
    public void closed() {
        if (m_historical) {
            ApiDemo.INSTANCE.controller().cancelHistoricalData(this);
        } else {
            ApiDemo.INSTANCE.controller().cancelRealtimeBars(this);
        }
    }

    @Override
    public void historicalData(Bar bar, boolean hasGaps) {
        m_model.m_rows.add(bar);
    }

    @Override
    public void historicalDataEnd() {
        fire();
    }

    @Override
    public void realtimeBar(Bar bar) {
        m_model.m_rows.add(bar);
        fire();
    }

    private void fire() {
        SwingUtilities.invokeLater(new Runnable() {
            @Override
            public void run() {
                m_model.fireTableRowsInserted(m_model.m_rows.size() - 1, m_model.m_rows.size() - 1);
                m_chart.repaint();
            }
        });
    }


}
