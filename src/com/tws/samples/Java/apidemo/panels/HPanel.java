package com.tws.samples.Java.apidemo.panels;

import com.tws.samples.Java.apidemo.util.VerticalPanel;

import java.awt.*;

/**
 * Created by Alfred on 8/11/2014.
 */
public class HPanel extends VerticalPanel.HorzPanel {
    @Override
    public Dimension getMaximumSize() {
        return super.getPreferredSize();
    }
}
