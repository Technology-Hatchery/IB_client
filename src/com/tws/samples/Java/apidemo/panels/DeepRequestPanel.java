package com.tws.samples.Java.apidemo.panels;

import com.ib.controller.NewContract;
import com.tws.samples.Java.apidemo.ApiDemo;
import com.tws.samples.Java.apidemo.util.HtmlButton;
import com.tws.samples.Java.apidemo.util.VerticalPanel;

import javax.swing.*;

/**
 * Created by Alfred on 8/11/2014.
 */
public class DeepRequestPanel extends JPanel {
    final NewContract m_contract = new NewContract();
    final ContractPanel m_contractPanel = new ContractPanel(m_contract);

    public DeepRequestPanel() {
        HtmlButton reqDeep = new HtmlButton("Request Deep Market Data") {
            @Override
            protected void actionPerformed() {
                onDeep();
            }
        };

        VerticalPanel butPanel = new VerticalPanel();
        butPanel.add(reqDeep);

        setLayout(new BoxLayout(this, BoxLayout.X_AXIS));
        add(m_contractPanel);
        add(Box.createHorizontalStrut(20));
        add(butPanel);
    }

    protected void onDeep() {
        m_contractPanel.onOK();
        DeepResultsPanel resultPanel = new DeepResultsPanel();
        MarketDataPanel.m_resultsPanel.addTab("Deep " + m_contract.symbol(), resultPanel, true, true);
        ApiDemo.INSTANCE.controller().reqDeepMktData(m_contract, 6, resultPanel);
    }
}
