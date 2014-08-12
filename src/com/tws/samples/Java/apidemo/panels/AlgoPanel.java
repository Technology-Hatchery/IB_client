package com.tws.samples.Java.apidemo.panels;

import com.ib.client.TagValue;
import com.ib.controller.Types;
import com.tws.samples.Java.apidemo.TicketDlg;
import com.tws.samples.Java.apidemo.util.TCombo;
import com.tws.samples.Java.apidemo.util.UpperField;
import com.tws.samples.Java.apidemo.util.VerticalPanel;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

/**
 * Created by Alfred on 8/11/2014.
 */
public class AlgoPanel extends VerticalPanel {
    final TCombo<Types.AlgoStrategy> m_strategy = new TCombo<Types.AlgoStrategy>(Types.AlgoStrategy.values());
    final UpperField[] m_params = new UpperField[Types.AlgoParam.values().length];

    public AlgoPanel() {
        add("Algo strategy", m_strategy);

        for (Types.AlgoParam param : Types.AlgoParam.values()) {
            int i = param.ordinal();
            m_params[i] = new UpperField(11);
            add(param.toString(), m_params[param.ordinal()]);
        }

        m_strategy.setSelectedItem(TicketDlg.m_order.algoStrategy());

        if (TicketDlg.m_order.algoParams() != null) {
            for (TagValue tagVal : TicketDlg.m_order.algoParams()) {
                Types.AlgoParam param = Types.AlgoParam.valueOf(tagVal.m_tag);
                m_params[param.ordinal()].setText(tagVal.m_value);
            }
        }

        m_strategy.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                onSelChanged();
            }
        });

        onSelChanged();
    }

    void onSelChanged() {
        for (int i = 0; i < m_params.length; i++) {
            m_params[i].setEnabled(false);
        }

        Types.AlgoStrategy strategy = m_strategy.getSelectedItem();
        if (strategy != null) {
            for (Types.AlgoParam param : strategy.params()) {
                m_params[param.ordinal()].setEnabled(true);
            }
        }
    }

    public void onOK() {
        TicketDlg.m_order.algoStrategy(m_strategy.getSelectedItem());

        TicketDlg.m_order.algoParams().clear();
        for (Types.AlgoParam param : Types.AlgoParam.values()) {
            String val = m_params[param.ordinal()].getText();
            if (val != null && val.length() > 0) {
                TicketDlg.m_order.algoParams().add(new TagValue(param.toString(), val));
            }
        }
    }
}
