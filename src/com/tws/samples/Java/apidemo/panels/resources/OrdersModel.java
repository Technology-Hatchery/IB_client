package com.tws.samples.Java.apidemo.panels.resources;

import com.ib.controller.NewContract;
import com.ib.controller.NewOrder;
import com.ib.controller.NewOrderState;
import com.ib.controller.OrderStatus;
import com.ib.interfaces.ILiveOrderHandler;

import javax.swing.table.AbstractTableModel;
import java.util.ArrayList;
import java.util.HashMap;

/**
 * Created by Alfred on 8/11/2014.
 */
public class OrdersModel extends AbstractTableModel implements ILiveOrderHandler {
    private HashMap<Long, OrderRow> m_map = new HashMap<Long, OrderRow>();
    private ArrayList<OrderRow> m_orders = new ArrayList<OrderRow>();

    @Override
    public int getRowCount() {
        return m_orders.size();
    }

    public void clear() {
        m_orders.clear();
        m_map.clear();
    }

    public OrderRow get(int i) {
        return m_orders.get(i);
    }

    @Override
    public void openOrder(NewContract contract, NewOrder order, NewOrderState orderState) {
        OrderRow full = m_map.get(order.permId());

        if (full != null) {
            full.m_order = order;
            full.m_state = orderState;
            fireTableDataChanged();
        } else if (shouldAdd(contract, order, orderState)) {
            full = new OrderRow(contract, order, orderState);
            add(full);
            m_map.put(order.permId(), full);
            fireTableDataChanged();
        }
    }

    protected boolean shouldAdd(NewContract contract, NewOrder order, NewOrderState orderState) {
        return true;
    }

    protected void add(OrderRow full) {
        m_orders.add(full);
    }

    @Override
    public void openOrderEnd() {
    }

    @Override
    public void orderStatus(int orderId, OrderStatus status, int filled, int remaining, double avgFillPrice, long permId, int parentId, double lastFillPrice, int clientId, String whyHeld) {
        OrderRow full = m_map.get(permId);
        if (full != null) {
            full.m_state.status(status);
        }
        fireTableDataChanged();
    }

    @Override
    public int getColumnCount() {
        return 8;
    }

    @Override
    public String getColumnName(int col) {
        switch (col) {
            case 0:
                return "Perm ID";
            case 1:
                return "Client ID";
            case 2:
                return "Order ID";
            case 3:
                return "Account";
            case 4:
                return "Action";
            case 5:
                return "Quantity";
            case 6:
                return "Contract";
            case 7:
                return "Status";
            default:
                return null;
        }
    }

    @Override
    public Object getValueAt(int row, int col) {
        OrderRow fullOrder = m_orders.get(row);
        NewOrder order = fullOrder.m_order;
        switch (col) {
            case 0:
                return order.permId();
            case 1:
                return order.clientId();
            case 2:
                return order.orderId();
            case 3:
                return order.account();
            case 4:
                return order.action();
            case 5:
                return order.totalQuantity();
            case 6:
                return fullOrder.m_contract.description();
            case 7:
                return fullOrder.m_state.status();
            default:
                return null;
        }
    }

    @Override
    public void handle(int orderId, int errorCode, String errorMsg) {
    }
}
