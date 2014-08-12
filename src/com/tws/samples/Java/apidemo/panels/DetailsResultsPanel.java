package com.tws.samples.Java.apidemo.panels;

import com.ib.controller.NewContractDetails;
import com.ib.interfaces.IContractDetailsHandler;

import javax.swing.*;
import java.awt.*;
import java.util.ArrayList;

/**
 * Created by Alfred on 8/11/2014.
 */
public class DetailsResultsPanel extends JPanel implements IContractDetailsHandler {
    JLabel m_label = new JLabel();
    JTextArea m_text = new JTextArea();

    DetailsResultsPanel() {
        JScrollPane scroll = new JScrollPane(m_text);

        setLayout(new BorderLayout());
        add(m_label, BorderLayout.NORTH);
        add(scroll);
    }

    @Override
    public void contractDetails(ArrayList<NewContractDetails> list) {
        // set label
        if (list.size() == 0) {
            m_label.setText("No matching contracts were found");
        } else if (list.size() > 1) {
            m_label.setText(list.size() + " contracts returned; showing first contract only");
        } else {
            m_label.setText(null);
        }

        // set text
        if (list.size() == 0) {
            m_text.setText(null);
        } else {
            m_text.setText(list.get(0).toString());
        }
    }
}
