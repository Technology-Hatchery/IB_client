/* Copyright (C) 2013 Interactive Brokers LLC. All rights reserved.  This code is subject to the terms
 * and conditions of the IB API Non-Commercial License or the IB API Commercial License, as applicable. */

package com.tws.samples.Java.apidemo.panels;

import java.awt.BorderLayout;
import java.awt.Desktop;
import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;

import javax.swing.Box;
import javax.swing.BoxLayout;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;

import com.tws.samples.Java.apidemo.panels.DetailsRequestPanel;
import com.tws.samples.Java.apidemo.panels.FundaRequestPanel;
import com.tws.samples.Java.apidemo.util.HtmlButton;
import com.tws.samples.Java.apidemo.util.NewTabbedPanel;
import com.tws.samples.Java.apidemo.util.NewTabbedPanel.INewTab;
import com.tws.samples.Java.apidemo.util.TCombo;
import com.tws.samples.Java.apidemo.util.VerticalPanel;

import com.ib.interfaces.IContractDetailsHandler;
import com.ib.interfaces.IFundamentalsHandler;
import com.ib.controller.NewContract;
import com.ib.controller.NewContractDetails;
import com.ib.controller.Types.FundamentalType;

public class ContractInfoPanel extends JPanel {
    public static NewContract m_contract = new NewContract();
    private final NewTabbedPanel m_requestPanels = new NewTabbedPanel();
    public static NewTabbedPanel m_resultsPanels = new NewTabbedPanel();

    public ContractInfoPanel() {
        m_requestPanels.addTab("Contract details", new DetailsRequestPanel());
        m_requestPanels.addTab("Fundamentals", new FundaRequestPanel());

        setLayout(new BorderLayout());
        add(m_requestPanels, BorderLayout.NORTH);
        add(m_resultsPanels);
    }


}
