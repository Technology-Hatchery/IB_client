package com.tws.samples.Java.apidemo.panels;

import com.ib.controller.Types;
import com.tws.samples.Java.apidemo.ApiDemo;
import com.tws.samples.Java.apidemo.panels.resources.TopModel;
import com.tws.samples.Java.apidemo.panels.resources.TopTable;
import com.tws.samples.Java.apidemo.util.HtmlButton;
import com.tws.samples.Java.apidemo.util.NewTabbedPanel;
import com.tws.samples.Java.apidemo.util.TCombo;
import com.tws.samples.Java.apidemo.util.VerticalPanel;

import javax.swing.*;
import javax.swing.table.TableCellRenderer;
import java.awt.*;

/**
 * Created by Alfred on 8/11/2014.
 */
public class TopResultsPanel extends NewTabbedPanel.NewTabPanel {
    public static TopModel m_model = new TopModel();
    final JTable m_tab = new TopTable(m_model);
    final TCombo<Types.MktDataType> m_typeCombo = new TCombo<Types.MktDataType>(Types.MktDataType.values());

    TopResultsPanel() {
        m_typeCombo.removeItemAt(0);

        JScrollPane scroll = new JScrollPane(m_tab);

        HtmlButton reqType = new HtmlButton("Go") {
            @Override
            protected void actionPerformed() {
                onReqType();
            }
        };

        VerticalPanel butPanel = new VerticalPanel();
        butPanel.add("Market data type", m_typeCombo, reqType);

        setLayout(new BorderLayout());
        add(scroll);
        add(butPanel, BorderLayout.SOUTH);
    }

    /**
     * Called when the tab is first visited.
     */
    @Override
    public void activated() {
    }

    /**
     * Called when the tab is closed by clicking the X.
     */
    @Override
    public void closed() {
        m_model.desubscribe();
        MarketDataPanel.m_topResultPanel = null;
    }

    void onReqType() {
        ApiDemo.INSTANCE.controller().reqMktDataType(m_typeCombo.getSelectedItem());
    }


}
