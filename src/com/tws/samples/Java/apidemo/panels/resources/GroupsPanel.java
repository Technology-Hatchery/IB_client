package com.tws.samples.Java.apidemo.panels.resources;

import com.tws.samples.Java.apidemo.panels.AdvisorPanel;
import com.tws.samples.Java.apidemo.util.HtmlButton;
import com.tws.samples.Java.apidemo.util.VerticalPanel;

import javax.swing.*;
import javax.swing.border.TitledBorder;
import java.awt.*;

/**
 * Created by Alfred on 8/11/2014.
 */
public class GroupsPanel extends JPanel {
    public GroupsPanel() {
        JScrollPane groupScroll = new JScrollPane(AdvisorPanel.m_groupTable);
        groupScroll.setBorder(new TitledBorder("Groups"));

        HtmlButton create = new HtmlButton("Create Group") {
            @Override
            protected void actionPerformed() {
                onCreateGroup();
            }
        };

        HtmlButton update = new HtmlButton("Update") {
            @Override
            protected void actionPerformed() {
                onTransmit();
            }
        };

        JPanel buts = new VerticalPanel();
        buts.add(create);
        buts.add(update);

        setLayout(new BorderLayout());
        add(groupScroll);
        add(buts, BorderLayout.EAST);
    }

    protected void onCreateGroup() {
        String name = JOptionPane.showInputDialog(this, "Enter group name");
        if (name != null) {
            AdvisorPanel.m_groupModel.add(name);
        }
    }

    protected void onTransmit() {
        int rc = JOptionPane.showConfirmDialog(this, "This will replace all Groups in TWS with the ones shown here.\nAre you sure you want to do that?", "Confirm", JOptionPane.YES_NO_OPTION);
        if (rc == 0) {
            AdvisorPanel.m_groupModel.transmit();
            JOptionPane.showMessageDialog(this, "The groups have been updated");
        }
    }
}
