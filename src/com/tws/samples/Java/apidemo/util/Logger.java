package com.tws.samples.Java.apidemo.util;

import com.ib.controller.ApiConnection;
import com.ib.interfaces.ILogger;

import javax.swing.*;

/**
 * Created by Alfred on 8/10/2014.
 */
public class Logger implements ILogger {
    final private JTextArea m_area;

    public Logger( JTextArea area) {
        m_area = area;
    }

    @Override public void log(final String str) {
        SwingUtilities.invokeLater( new Runnable() {
            @Override public void run() {
//					m_area.append(str);
//
//					Dimension d = m_area.getSize();
//					m_area.scrollRectToVisible( new Rectangle( 0, d.height, 1, 1) );
            }
        });
    }
}