/* Copyright (C) 2013 Interactive Brokers LLC. All rights reserved.  This code is subject to the terms
 * and conditions of the IB API Non-Commercial License or the IB API Commercial License, as applicable. */

package com.tws.samples.Java.apidemo.panels;

import java.awt.BorderLayout;
import java.awt.Desktop;
import java.awt.Dimension;
import java.awt.GridLayout;
import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.HashSet;

import javax.swing.Box;
import javax.swing.BoxLayout;
import javax.swing.JCheckBox;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.SwingUtilities;
import javax.swing.table.AbstractTableModel;
import javax.swing.table.TableCellRenderer;


import com.ib.client.ComboLeg;
import com.tws.samples.Java.apidemo.panels.*;
import com.tws.samples.Java.apidemo.util.HtmlButton;
import com.tws.samples.Java.apidemo.util.NewTabbedPanel;
import com.tws.samples.Java.apidemo.util.TCombo;
import com.tws.samples.Java.apidemo.util.UpperField;
import com.tws.samples.Java.apidemo.util.VerticalPanel;
import com.tws.samples.Java.apidemo.util.NewTabbedPanel.NewTabPanel;
import com.tws.samples.Java.apidemo.util.VerticalPanel.StackPanel;

import com.ib.client.ScannerSubscription;
import com.ib.controller.Bar;
import com.ib.controller.Instrument;
import com.ib.controller.NewContract;
import com.ib.controller.NewContractDetails;
import com.ib.controller.ScanCode;
import com.ib.interfaces.IDeepMktDataHandler;
import com.ib.interfaces.IHistoricalDataHandler;
import com.ib.interfaces.IRealTimeBarHandler;
import com.ib.interfaces.IScannerHandler;
import com.ib.controller.Types.BarSize;
import com.ib.controller.Types.DeepSide;
import com.ib.controller.Types.DeepType;
import com.ib.controller.Types.DurationUnit;
import com.ib.controller.Types.MktDataType;
import com.ib.controller.Types.WhatToShow;

public class MarketDataPanel extends JPanel {
    //public NewContract m_contract; // = new NewContract();
    public final NewTabbedPanel m_requestPanel = new NewTabbedPanel();
    public static NewTabbedPanel m_resultsPanel = new NewTabbedPanel();
    public static TopResultsPanel m_topResultPanel;

    public MarketDataPanel() {
        /*m_contract = new NewContract(new Contract(int p_conId, String p_symbol, String p_secType, String p_expiry,
        double p_strike, String p_right, String p_multiplier,
                String p_exchange, String p_currency, String p_localSymbol, String p_tradingClass,
                Vector< ComboLeg > p_comboLegs, String p_primaryExch, boolean p_includeExpired,
        String p_secIdType, String p_secId))*/
        m_requestPanel.addTab("Top Market Data", new TopRequestPanel());
        m_requestPanel.addTab("Deep Book", new DeepRequestPanel());
        m_requestPanel.addTab("Historical Data", new HistRequestPanel(m_resultsPanel));
        m_requestPanel.addTab("Real-time Bars", new RealtimeRequestPanel());
        m_requestPanel.addTab("Market Scanner", new ScannerRequestPanel());

        setLayout(new BorderLayout());
        add(m_requestPanel, BorderLayout.NORTH);
        add(m_resultsPanel);
    }


}
