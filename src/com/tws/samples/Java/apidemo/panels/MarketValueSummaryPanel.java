/* Copyright (C) 2013 Interactive Brokers LLC. All rights reserved.  This code is subject to the terms
 * and conditions of the IB API Non-Commercial License or the IB API Commercial License, as applicable. */

package com.tws.samples.Java.apidemo.panels;

import java.awt.BorderLayout;

import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;

import com.tws.samples.Java.apidemo.ApiDemo;
import com.tws.samples.Java.apidemo.panels.resources.MktValModel;
import com.tws.samples.Java.apidemo.panels.resources.Table;
import com.tws.samples.Java.apidemo.util.HtmlButton;
import com.tws.samples.Java.apidemo.util.VerticalPanel;
import com.tws.samples.Java.apidemo.util.NewTabbedPanel.NewTabPanel;

import com.ib.interfaces.IMarketValueSummaryHandler;
import com.ib.controller.MarketValueTag;

public class MarketValueSummaryPanel extends NewTabPanel implements IMarketValueSummaryHandler {
    private MktValModel m_model = new MktValModel();

    public MarketValueSummaryPanel() {
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

        JTable table = new Table(m_model, 2);
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
        ApiDemo.INSTANCE.controller().reqMarketValueSummary("All", this);
    }

    private void desubscribe() {
        ApiDemo.INSTANCE.controller().cancelMarketValueSummary(this);
        m_model.clear();
    }

    @Override
    public void marketValueSummary(String account, MarketValueTag tag, String value, String currency) {
        m_model.handle(account, currency, tag, value);
    }

    @Override
    public void marketValueSummaryEnd() {
    }
}
