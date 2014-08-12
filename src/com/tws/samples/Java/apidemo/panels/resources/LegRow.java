package com.tws.samples.Java.apidemo.panels.resources;

import com.ib.controller.NewComboLeg;
import com.ib.controller.NewContract;

/**
 * Created by Alfred on 8/11/2014.
 */
public class LegRow {
    public NewContract m_contract;
    public NewComboLeg m_leg = new NewComboLeg();

    public LegRow(NewContract c, NewComboLeg leg) {
        m_contract = c;
        m_leg = leg;
    }
}
