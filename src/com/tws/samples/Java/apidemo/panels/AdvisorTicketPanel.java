package com.tws.samples.Java.apidemo.panels;

import com.ib.controller.Types;
import com.tws.samples.Java.apidemo.TicketDlg;
import com.tws.samples.Java.apidemo.util.TCombo;
import com.tws.samples.Java.apidemo.util.UpperField;
import com.tws.samples.Java.apidemo.util.VerticalPanel;

import javax.swing.*;

/**
 * Created by Alfred on 8/11/2014.
 */
public class AdvisorTicketPanel extends VerticalPanel {
    final UpperField m_faGroup = new UpperField();
    final TCombo<Types.Method> m_faMethod = new TCombo<Types.Method>(Types.Method.values());
    final UpperField m_faPercentage = new UpperField();
    final UpperField m_faProfile = new UpperField();

    public AdvisorTicketPanel() {
        m_faGroup.setText(TicketDlg.m_order.faGroup());
        m_faMethod.setSelectedItem(TicketDlg.m_order.faMethod());
        m_faPercentage.setText(TicketDlg.m_order.faPercentage());
        m_faProfile.setText(TicketDlg.m_order.faProfile());

        add("Group", m_faGroup);
        add("Method", m_faMethod);
        add("Percentage", m_faPercentage);
        add(Box.createVerticalStrut(10));
        add("--or--");
        add(Box.createVerticalStrut(10));
        add("Profile", m_faProfile);
    }

    public void onOK() {
        TicketDlg.m_order.faGroup(m_faGroup.getText());
        TicketDlg.m_order.faMethod(m_faMethod.getSelectedItem());
        TicketDlg.m_order.faPercentage(m_faPercentage.getText());
        TicketDlg.m_order.faProfile(m_faProfile.getText());
    }
}
