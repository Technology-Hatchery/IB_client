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
public class ProfilesPanel extends JPanel {
    public ProfilesPanel() {
        JScrollPane profileScroll = new JScrollPane(AdvisorPanel.m_profileTable);
        profileScroll.setBorder(new TitledBorder("Profiles"));

        HtmlButton create = new HtmlButton("Create Profile") {
            @Override
            protected void actionPerformed() {
                onCreateProfile();
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
        add(profileScroll);
        add(buts, BorderLayout.EAST);
    }

    void onCreateProfile() {
        String name = JOptionPane.showInputDialog(this, "Enter profile name");
        if (name != null) {
            AdvisorPanel.m_profileModel.add(name);
        }
    }

    void onTransmit() {
        int rc = JOptionPane.showConfirmDialog(this, "This will replace all Profiles in TWS with the ones shown here.\nAre you sure you want to do that?", "Confirm", JOptionPane.YES_NO_OPTION);
        if (rc == 0) {
            AdvisorPanel.m_profileModel.transmit();
            JOptionPane.showMessageDialog(this, "The Profiles have been updated");
        }
    }
}
