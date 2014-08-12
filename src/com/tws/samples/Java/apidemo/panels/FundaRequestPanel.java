package com.tws.samples.Java.apidemo.panels;

import com.ib.controller.Types;
import com.tws.samples.Java.apidemo.ApiDemo;
import com.tws.samples.Java.apidemo.util.HtmlButton;
import com.tws.samples.Java.apidemo.util.TCombo;
import com.tws.samples.Java.apidemo.util.VerticalPanel;

import javax.swing.*;

/**
 * Created by Alfred on 8/11/2014.
 */
public class FundaRequestPanel extends JPanel {
    ContractPanel m_contractPanel = new ContractPanel(ContractInfoPanel.m_contract);
    TCombo<Types.FundamentalType> m_type = new TCombo<Types.FundamentalType>(Types.FundamentalType.values());

    public FundaRequestPanel() {
        HtmlButton but = new HtmlButton("Query") {
            @Override
            protected void actionPerformed() {
                onQuery();
            }
        };

        VerticalPanel rightPanel = new VerticalPanel();
        rightPanel.add("Report type", m_type);

        setLayout(new BoxLayout(this, BoxLayout.X_AXIS));
        add(m_contractPanel);
        add(Box.createHorizontalStrut(20));
        add(rightPanel);
        add(Box.createHorizontalStrut(10));
        add(but);
    }

    protected void onQuery() {
        m_contractPanel.onOK();
        FundaResultPanel panel = new FundaResultPanel();
        Types.FundamentalType type = m_type.getSelectedItem();
        ContractInfoPanel.m_resultsPanels.addTab(ContractInfoPanel.m_contract.symbol() + " " + type, panel, true, true);
        ApiDemo.INSTANCE.controller().reqFundamentals(ContractInfoPanel.m_contract, type, panel);
    }
}
