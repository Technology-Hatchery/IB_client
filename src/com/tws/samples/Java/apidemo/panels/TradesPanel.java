/* Copyright (C) 2013 Interactive Brokers LLC. All rights reserved.  This code is subject to the terms
 * and conditions of the IB API Non-Commercial License or the IB API Commercial License, as applicable. */

package com.tws.samples.Java.apidemo.panels;

import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.util.ArrayList;
import java.util.HashMap;

import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.border.TitledBorder;
import javax.swing.table.AbstractTableModel;


import com.tws.samples.Java.apidemo.ApiDemo;
import com.tws.samples.Java.apidemo.panels.resources.FullExec;
import com.tws.samples.Java.apidemo.panels.resources.Model;
import com.tws.samples.Java.apidemo.util.HtmlButton;

import com.ib.client.CommissionReport;
import com.ib.client.Execution;
import com.ib.client.ExecutionFilter;
import com.ib.controller.NewContract;
import com.ib.interfaces.ITradeReportHandler;

public class TradesPanel extends JPanel implements ITradeReportHandler {
    public static ArrayList<FullExec> m_trades = new ArrayList<FullExec>();
    private HashMap<String, FullExec> m_map = new HashMap<String, FullExec>();
    private Model m_model = new Model();

    public TradesPanel() {
        JTable table = new JTable(m_model);
        JScrollPane scroll = new JScrollPane(table);
        scroll.setBorder(new TitledBorder("Trade Log"));

        HtmlButton but = new HtmlButton("Refresh") {
            @Override
            public void actionPerformed() {
                onRefresh();
            }
        };

        JPanel p = new JPanel(new FlowLayout(FlowLayout.RIGHT));
        p.add(but);

        setLayout(new BorderLayout());
        add(scroll);
        add(p, BorderLayout.SOUTH);
    }

    public void activated() {
        onRefresh();
    }

    private void onRefresh() {
        ApiDemo.INSTANCE.controller().reqExecutions(new ExecutionFilter(), this);
    }

    @Override
    public void tradeReport(String tradeKey, NewContract contract, Execution trade) {
        FullExec full = m_map.get(tradeKey);

        if (full != null) {
            full.m_trade = trade;
        } else {
            full = new FullExec(contract, trade);
            m_trades.add(full);
            m_map.put(tradeKey, full);
        }

        m_model.fireTableDataChanged();
    }

    @Override
    public void tradeReportEnd() {
    }

    @Override
    public void commissionReport(String tradeKey, CommissionReport commissionReport) {
        FullExec full = m_map.get(tradeKey);
        if (full != null) {
            full.m_commissionReport = commissionReport;
        }
    }


}
