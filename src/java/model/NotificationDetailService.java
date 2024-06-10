/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;
import javax.annotation.Resource;
import javax.persistence.*;

public class NotificationDetailService {

    @PersistenceContext
    EntityManager mgr;
    @Resource
    Query query;

    public NotificationDetailService(EntityManager mgr) {
        this.mgr = mgr;
    }

    public boolean addItem(NotificationDetail notification) {
        mgr.persist(notification);
        return true;
    }

//    public Users findItemByCode(String code) {
//        Notification notification = mgr.find(Notification.class, code);
//        return notification;
//    }
    public List<NotificationDetail> findAll() {
        List notificationtList = mgr.createNamedQuery("NotificationDetail.findAll").getResultList();
        return notificationtList;
    }

    public List<CustomerServiceTable> findCustomerServiceTableReport() {
        List CustomerServiceList = mgr.createNamedQuery("NotificationDetail.findCustomerServiceTableReport").getResultList();
        return CustomerServiceList;
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
