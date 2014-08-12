/* Copyright (C) 2013 Interactive Brokers LLC. All rights reserved.  This code is subject to the terms
 * and conditions of the IB API Non-Commercial License or the IB API Commercial License, as applicable. */

package com.tws.samples.Java.apidemo.panels;

import java.awt.BorderLayout;
import java.util.ArrayList;
import java.util.HashMap;

import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.AbstractTableModel;

import com.tws.samples.Java.apidemo.ApiDemo;
import com.tws.samples.Java.apidemo.panels.AccountInfoPanel;
import com.tws.samples.Java.apidemo.panels.resources.Table;
import com.tws.samples.Java.apidemo.panels.resources.SummaryModel;
import com.tws.samples.Java.apidemo.util.HtmlButton;
import com.tws.samples.Java.apidemo.util.NewTabbedPanel.NewTabPanel;
import com.tws.samples.Java.apidemo.util.VerticalPanel;

import com.ib.controller.AccountSummaryTag;
import com.ib.interfaces.IAccountSummaryHandler;
import com.ib.controller.Formats;


public class AccountSummaryPanel extends NewTabPanel {
    private SummaryModel m_model = new SummaryModel();

    public AccountSummaryPanel() {
        HtmlButton sub = new HtmlButton("Subscribe") {
            protected void actionPerformed() {
                subscribe();
            }
        };

        HtmlButton desub = new HtmlButton("Desubscribe") {
            protected void actionPerformed() {
                desubscribe();
            }
        };

        JPanel buts = new VerticalPanel();
        buts.add(sub);
        buts.add(desub);

        JTable table = new Table(m_model);
        JScrollPane scroll = new JScrollPane(table);

        setLayout(new BorderLayout());
        add(scroll);
        add(buts, BorderLayout.EAST);
    }

    /**
     * Called when the tab is first visited.
     */
    @Override
    public void activated() {
        subscribe();
    }

    /**
     * Called when the tab is closed by clicking the X.
     */
    @Override
    public void closed() {
        desubscribe();
    }

    private void subscribe() {
        ApiDemo.INSTANCE.controller().reqAccountSummary("All", AccountSummaryTag.values(), m_model);
    }

    private void desubscribe() {
        ApiDemo.INSTANCE.controller().cancelAccountSummary(m_model);
        m_model.clear();
    }


}
