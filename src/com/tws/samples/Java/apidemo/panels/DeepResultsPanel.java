package com.tws.samples.Java.apidemo.panels;

import com.ib.controller.Types;
import com.ib.interfaces.IDeepMktDataHandler;
import com.tws.samples.Java.apidemo.ApiDemo;
import com.tws.samples.Java.apidemo.panels.resources.DeepModel;
import com.tws.samples.Java.apidemo.util.HtmlButton;
import com.tws.samples.Java.apidemo.util.NewTabbedPanel;

import javax.swing.*;
import javax.swing.table.AbstractTableModel;
import java.awt.*;
import java.util.ArrayList;

/**
 * Created by Alfred on 8/11/2014.
 */
public class DeepResultsPanel extends NewTabbedPanel.NewTabPanel implements IDeepMktDataHandler {
    final DeepModel m_buy = new DeepModel();
    final DeepModel m_sell = new DeepModel();

    DeepResultsPanel() {
        HtmlButton desub = new HtmlButton("Desubscribe") {
            public void actionPerformed() {
                onDesub();
            }
        };

        JTable buyTab = new JTable(m_buy);
        JTable sellTab = new JTable(m_sell);

        JScrollPane buyScroll = new JScrollPane(buyTab);
        JScrollPane sellScroll = new JScrollPane(sellTab);

        JPanel mid = new JPanel(new GridLayout(1, 2));
        mid.add(buyScroll);
        mid.add(sellScroll);

        setLayout(new BorderLayout());
        add(mid);
        add(desub, BorderLayout.SOUTH);
    }

    protected void onDesub() {
        ApiDemo.INSTANCE.controller().cancelDeepMktData(this);
    }

    @Override
    public void activated() {
    }

    /**
     * Called when the tab is closed by clicking the X.
     */
    @Override
    public void closed() {
        ApiDemo.INSTANCE.controller().cancelDeepMktData(this);
    }

    @Override
    public void updateMktDepth(int pos, String mm, Types.DeepType operation, Types.DeepSide side, double price, int size) {
        if (side == Types.DeepSide.BUY) {
            m_buy.updateMktDepth(pos, mm, operation, price, size);
        } else {
            m_sell.updateMktDepth(pos, mm, operation, price, size);
        }
    }




}
