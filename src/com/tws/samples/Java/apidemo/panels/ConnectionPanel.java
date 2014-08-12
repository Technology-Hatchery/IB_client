package com.tws.samples.Java.apidemo.panels;

import com.tws.samples.Java.apidemo.ApiDemo;
import com.tws.samples.Java.apidemo.util.HtmlButton;
import com.tws.samples.Java.apidemo.util.VerticalPanel;

import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.awt.*;

/**
 * Created by Alfred on 8/11/2014.
 */
public class ConnectionPanel extends JPanel {
    private final JTextField m_host = new JTextField(7);
    private final JTextField m_port = new JTextField("7496", 7);
    private final JTextField m_clientId = new JTextField("0", 7);
    public final JLabel m_status = new JLabel("Disconnected");

    public ConnectionPanel() {
        HtmlButton connect = new HtmlButton("Connect") {
            @Override
            public void actionPerformed() {
                onConnect();
            }
        };

        HtmlButton disconnect = new HtmlButton("Disconnect") {
            @Override
            public void actionPerformed() {
                ApiDemo.m_controller.disconnect();
            }
        };

        JPanel p1 = new VerticalPanel();
        p1.add("Host", m_host);
        p1.add("Port", m_port);
        p1.add("Client ID", m_clientId);

        JPanel p2 = new VerticalPanel();
        p2.add(connect);
        p2.add(disconnect);
        p2.add(Box.createVerticalStrut(20));

        JPanel p3 = new VerticalPanel();
        p3.setBorder(new EmptyBorder(20, 0, 0, 0));
        p3.add("Connection status: ", m_status);

        JPanel p4 = new JPanel(new BorderLayout());
        p4.add(p1, BorderLayout.WEST);
        p4.add(p2);
        p4.add(p3, BorderLayout.SOUTH);

        setLayout(new BorderLayout());
        add(p4, BorderLayout.NORTH);
    }

    protected void onConnect() {
        int port = Integer.parseInt(m_port.getText());
        int clientId = Integer.parseInt(m_clientId.getText());
        ApiDemo.m_controller.connect(m_host.getText(), port, clientId);
    }
}
