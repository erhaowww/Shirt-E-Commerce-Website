/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;
import javax.annotation.Resource;
import javax.persistence.*;

public class NotificationService {

    @PersistenceContext
    EntityManager mgr;
    @Resource
    Query query;

    public NotificationService(EntityManager mgr) {
        this.mgr = mgr;
    }

    public boolean addItem(Notification notification) {
        mgr.persist(notification);
        return true;
    }

//    public Users findItemByCode(String code) {
//        Notification notification = mgr.find(Notification.class, code);
//        return notification;
//    }
    public Notification findLast() {
        Notification notificationLastId = (Notification) mgr.createNamedQuery("Notification.findByLastNotificationId");
        return notificationLastId;
    }

    public List<Notification> findAll() {
        List notificationtList = mgr.createNamedQuery("Notification.findAll").getResultList();
        return notificationtList;
    }

    public List<CustomerService> findCustomerServiceChartReport() {
        List CustomerServiceChart = mgr.createNamedQuery("Notification.findCustomerServiceChartReport").getResultList();
        return CustomerServiceChart;
    }
    public List<CustomerServiceTable> findCustomerServiceTableReport() {
        List CustomerServiceList = mgr.createNamedQuery("Notification.findCustomerServiceTableReport").getResultList();
        return CustomerServiceList;
    }

    public List<Notification> findByUserNoti(int userId) {
        List notificationtList = mgr.createNamedQuery("Notification.findByUserNoti").setParameter("userId", userId).getResultList();
        return notificationtList;
    }

    public Notification Search(int id) {
        Notification notification = mgr.find(Notification.class, id);
        return notification;
    }

//     public boolean deleteItem(String code) {
//        Users users = findItemByCode(code);
//        if (users != null) {
//            mgr.remove(users);
//            return true;
//        }
//        return false;
//    }
}
