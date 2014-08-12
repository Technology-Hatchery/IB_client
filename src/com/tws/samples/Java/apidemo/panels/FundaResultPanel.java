package com.tws.samples.Java.apidemo.panels;

import com.ib.controller.Types;
import com.ib.interfaces.IFundamentalsHandler;
import com.tws.samples.Java.apidemo.ApiDemo;
import com.tws.samples.Java.apidemo.util.HtmlButton;
import com.tws.samples.Java.apidemo.util.NewTabbedPanel;

import javax.swing.*;
import java.awt.*;
import java.io.File;
import java.io.FileWriter;

/**
 * Created by Alfred on 8/11/2014.
 */
public class FundaResultPanel extends JPanel implements NewTabbedPanel.INewTab, IFundamentalsHandler {
    String m_data;
    JTextArea m_text = new JTextArea();

    FundaResultPanel() {
        HtmlButton b = new HtmlButton("View in browser") {
            @Override
            protected void actionPerformed() {
                onView();
            }
        };

        JScrollPane scroll = new JScrollPane(m_text);
        setLayout(new BorderLayout());
        add(scroll);
        add(b, BorderLayout.EAST);
    }

    protected void onView() {
        try {
            File file = File.createTempFile("tws", ".xml");
            FileWriter writer = new FileWriter(file);
            writer.write(m_text.getText());
            writer.flush();
            writer.close();
            Desktop.getDesktop().open(file);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Called when the tab is first visited.
     */
    @Override
    public void activated() {
        ApiDemo.INSTANCE.controller().reqFundamentals(ContractInfoPanel.m_contract, Types.FundamentalType.ReportRatios, this);
    }

    /**
     * Called when the tab is closed by clicking the X.
     */
    @Override
    public void closed() {
    }

    @Override
    public void fundamentals(String str) {
        m_data = str;
        m_text.setText(str);
    }
}
