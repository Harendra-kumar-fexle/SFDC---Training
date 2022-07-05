public with sharing class ProcessPurchaseOrder {
    public ProcessPurchaseOrder() {
        PurchaseOrder order1 = new CustomerPurchaseOrder();
        // Customer Order
        processOrder(order1);

        // Employee Order
        PurchaseOrder order2 = new EmployeePurchaseOrder();
        processOrder(order2);

    }

    public void processOrder(PurchaseOrder order) {
        System.debug('Check Discount: ' + order.discount());
    }
}