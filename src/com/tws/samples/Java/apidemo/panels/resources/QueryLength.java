package com.tws.samples.Java.apidemo.panels.resources;

import com.ib.controller.Types;

/**
 * Created by Alfred on 8/11/2014.
 */
public class QueryLength {
    public int m_units;
    public Types.DurationUnit m_unit;

    public QueryLength(int units, Types.DurationUnit unit) {
        m_units = units;
        m_unit = unit;
    }
}
