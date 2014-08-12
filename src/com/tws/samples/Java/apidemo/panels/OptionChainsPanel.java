/* Copyright (C) 2013 Interactive Brokers LLC. All rights reserved.  This code is subject to the terms
 * and conditions of the IB API Non-Commercial License or the IB API Commercial License, as applicable. */

package com.tws.samples.Java.apidemo.panels;

import static com.ib.controller.Formats.fmtNz;
import static com.ib.controller.Formats.fmtPct;

import java.awt.BorderLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

import javax.swing.Box;
import javax.swing.BoxLayout;
import javax.swing.JCheckBox;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.Timer;
import javax.swing.border.TitledBorder;
import javax.swing.table.AbstractTableModel;

import com.tws.samples.Java.apidemo.ApiDemo;
import com.tws.samples.Java.apidemo.panels.ChainPanel;
import com.tws.samples.Java.apidemo.util.HtmlButton;
import com.tws.samples.Java.apidemo.util.NewTabbedPanel;
import com.tws.samples.Java.apidemo.util.NewTabbedPanel.NewTabPanel;
import com.tws.samples.Java.apidemo.util.TCombo;
import com.tws.samples.Java.apidemo.util.UpperField;
import com.tws.samples.Java.apidemo.util.Util;
import com.tws.samples.Java.apidemo.util.VerticalPanel;

import com.ib.interfaces.IContractDetailsHandler;
import com.ib.interfaces.IOptHandler;
import com.ib.controller.ApiController.TopMktDataAdapter;
import com.ib.controller.NewContract;
import com.ib.controller.NewContractDetails;
import com.ib.controller.NewTickType;
import com.ib.controller.Types.Right;
import com.ib.controller.Types.SecType;

public class OptionChainsPanel extends JPanel {
    public static NewContract m_underContract = new NewContract();
    private NewTabbedPanel m_tabbedPanel = new NewTabbedPanel();
    private JTextField m_optExch = new UpperField();
    private UpperField m_symbol = new UpperField();
    private TCombo<SecType> m_secType = new TCombo<SecType>(SecType.values());
    private UpperField m_exchange = new UpperField();
    private UpperField m_currency = new UpperField();
    public static JCheckBox m_snapshot = new JCheckBox();

    public OptionChainsPanel() {
        m_symbol.setText("IBM");
        m_secType.setSelectedItem(SecType.STK);
        m_exchange.setText("SMART");
        m_currency.setText("USD");
        m_optExch.setText("SMART");

        HtmlButton button = new HtmlButton("Go") {
            @Override
            protected void actionPerformed() {
                onAdd();
            }
        };

        VerticalPanel topPanel = new VerticalPanel();
        topPanel.add("Symbol", m_symbol);
        topPanel.add("Currency", m_currency);
        topPanel.add("Underlying sec type", m_secType);
        topPanel.add("Underlying exchange", m_exchange, Box.createHorizontalStrut(20), button);
        topPanel.add("Option exchange", m_optExch);
        topPanel.add("Use snapshot data", m_snapshot);

        setLayout(new BorderLayout());
        add(topPanel, BorderLayout.NORTH);
        add(m_tabbedPanel);
    }

    protected void onAdd() {
        m_underContract.symbol(m_symbol.getText().toUpperCase());
        m_underContract.secType(m_secType.getSelectedItem());
        m_underContract.exchange(m_exchange.getText().toUpperCase());
        m_underContract.currency(m_currency.getText().toUpperCase());

        ApiDemo.INSTANCE.controller().reqContractDetails(m_underContract, new IContractDetailsHandler() {
            @Override
            public void contractDetails(ArrayList<NewContractDetails> list) {
                onRecUnderDetails(list);
            }
        });
    }

    protected void onRecUnderDetails(ArrayList<NewContractDetails> list) {
        if (list.size() != 1) {
            ApiDemo.INSTANCE.show("Error: " + list.size() + " underlying contracts returned");
            return;
        }

        // request option chains
        NewContract optContract = new NewContract();
        optContract.symbol(m_underContract.symbol());
        optContract.currency(m_underContract.currency());
        optContract.exchange(m_optExch.getText());
        optContract.secType(SecType.OPT);

        final ChainPanel symbolPanel = new ChainPanel();
        m_tabbedPanel.addTab(optContract.symbol(), symbolPanel, true, true);

        ApiDemo.INSTANCE.controller().reqContractDetails(optContract, symbolPanel);
    }


}
