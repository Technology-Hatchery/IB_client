package com.tws.samples.Java.apidemo.panels;

import com.tws.samples.Java.apidemo.ApiDemo;
import com.tws.samples.Java.apidemo.util.HtmlButton;

import javax.swing.*;

/**
 * Created by Alfred on 8/11/2014.
 */
public class DetailsRequestPanel extends JPanel {
    ContractPanel m_contractPanel = new ContractPanel(ContractInfoPanel.m_contract);

    public DetailsRequestPanel() {
        HtmlButton but = new HtmlButton("Query") {
            @Override
            protected void actionPerformed() {
                onQuery();
            }
        };

        setLayout(new BoxLayout(this, BoxLayout.X_AXIS));
        add(m_contractPanel);
        add(Box.createHorizontalStrut(20));
        add(but);
    }

    protected void onQuery() {
        m_contractPanel.onOK();

        DetailsResultsPanel panel = new DetailsResultsPanel();
        ContractInfoPanel.m_resultsPanels.addTab(ContractInfoPanel.m_contract.symbol() + " " + "Description", panel, true, true);
        ApiDemo.INSTANCE.controller().reqContractDetails(ContractInfoPanel.m_contract, panel);
    }
}
