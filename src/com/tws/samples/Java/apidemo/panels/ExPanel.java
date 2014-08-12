package com.tws.samples.Java.apidemo.panels;

import com.ib.controller.Position;
import com.ib.controller.Types;
import com.tws.samples.Java.apidemo.ApiDemo;
import com.tws.samples.Java.apidemo.util.HtmlButton;
import com.tws.samples.Java.apidemo.util.TCombo;
import com.tws.samples.Java.apidemo.util.UpperField;
import com.tws.samples.Java.apidemo.util.VerticalPanel;

import javax.swing.*;

/**
 * Created by Alfred on 8/11/2014.
 */
public class ExPanel extends VerticalPanel {
    TCombo<Types.ExerciseType> m_combo = new TCombo<Types.ExerciseType>(Types.ExerciseType.values());
    UpperField m_qty = new UpperField("1");
    JCheckBox m_override = new JCheckBox();

    public ExPanel() {
        HtmlButton but = new HtmlButton("Go") {
            protected void actionPerformed() {
                onExercise();
            }
        };

        m_combo.removeItem(Types.ExerciseType.None);

        add("Action", m_combo);
        add("Quantity", m_qty);
        add("Override", m_override);
        add(but);
    }

    protected void onExercise() {
        String account = (String) ExercisePanel.m_accounts.getSelectedValue();
        int i = ExercisePanel.m_portTable.getSelectedRow();
        if (i != -1 && account != null) {
            Position position = ExercisePanel.m_portfolioModel.getPosition(i);
            ApiDemo.INSTANCE.controller().exerciseOption(account, position.contract(), m_combo.getSelectedItem(), m_qty.getInt(), m_override.isSelected());
        }
    }
}
