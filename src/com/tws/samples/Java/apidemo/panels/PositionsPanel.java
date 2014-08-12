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
import com.tws.samples.Java.apidemo.panels.resources.PositionModel;
import com.tws.samples.Java.apidemo.panels.resources.Table;
import com.tws.samples.Java.apidemo.util.HtmlButton;
import com.tws.samples.Java.apidemo.util.VerticalPanel;
import com.tws.samples.Java.apidemo.util.NewTabbedPanel.NewTabPanel;

import com.ib.controller.Formats;
import com.ib.controller.NewContract;
import com.ib.interfaces.IPositionHandler;


public class PositionsPanel extends NewTabPanel {
    public static PositionModel m_model = new PositionModel();
    public static boolean m_complete;

    public PositionsPanel() {
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
     * Called when the tab is first visited. Sends request for all positions.
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
        ApiDemo.INSTANCE.controller().reqPositions(m_model);
    }

    private void desubscribe() {
        ApiDemo.INSTANCE.controller().cancelPositions(m_model);
        m_model.clear();
    }


}
