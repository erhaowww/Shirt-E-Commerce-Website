/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author User
 */
@Entity
@Table(name = "NOTIFICATION_DETAIL")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "NotificationDetail.findAll", query = "SELECT n FROM NotificationDetail n"),
    @NamedQuery(name = "NotificationDetail.findByNotificationId", query = "SELECT n FROM NotificationDetail n WHERE n.notificationDetailPK.notificationId = :notificationId"),
    @NamedQuery(name = "NotificationDetail.findByUserId", query = "SELECT n FROM NotificationDetail n WHERE n.notificationDetailPK.userId = :userId"),
    @NamedQuery(name = "NotificationDetail.findByNotificationDate", query = "SELECT n FROM NotificationDetail n WHERE n.notificationDate = :notificationDate"),
    @NamedQuery(name = "NotificationDetail.findByNotificationTime", query = "SELECT n FROM NotificationDetail n WHERE n.notificationTime = :notificationTime"),
//customer service table report
    @NamedQuery(name = "NotificationDetail.findCustomerServiceTableReport", query = "select new model.CustomerServiceTable("
            + "u.name, n.message, s.name, d.notificationDate, d.notificationTime) from NotificationDetail d join d.notification n, n.staffId s, d.users u")
})
public class NotificationDetail implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected NotificationDetailPK notificationDetailPK;
    @Size(max = 100)
    @Column(name = "NOTIFICATION_DATE")
    private String notificationDate;
    @Size(max = 100)
    @Column(name = "NOTIFICATION_TIME")
    private String notificationTime;
    @JoinColumn(name = "NOTIFICATION_ID", referencedColumnName = "NOTIFICATION_ID", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Notification notification;
    @JoinColumn(name = "USER_ID", referencedColumnName = "USER_ID", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Users users;

    public NotificationDetail() {
    }

    public NotificationDetail(NotificationDetailPK notificationDetailPK, String notificationDate, String notificationTime) {
        this.notificationDetailPK = notificationDetailPK;
        this.notificationDate = notificationDate;
        this.notificationTime = notificationTime;
    }

    public NotificationDetail(NotificationDetailPK notificationDetailPK) {
        this.notificationDetailPK = notificationDetailPK;
    }

    public NotificationDetail(int notificationId, int userId) {
        this.notificationDetailPK = new NotificationDetailPK(notificationId, userId);
    }

    public NotificationDetailPK getNotificationDetailPK() {
        return notificationDetailPK;
    }

    public void setNotificationDetailPK(NotificationDetailPK notificationDetailPK) {
        this.notificationDetailPK = notificationDetailPK;
    }

    public String getNotificationDate() {
        return notificationDate;
    }

    public void setNotificationDate(String notificationDate) {
        this.notificationDate = notificationDate;
    }

    public String getNotificationTime() {
        return notificationTime;
    }

    public void setNotificationTime(String notificationTime) {
        this.notificationTime = notificationTime;
    }

    public Notification getNotification() {
        return notification;
    }

    public void setNotification(Notification notification) {
        this.notification = notification;
    }

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (notificationDetailPK != null ? notificationDetailPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof NotificationDetail)) {
            return false;
        }
        NotificationDetail other = (NotificationDetail) object;
        if ((this.notificationDetailPK == null && other.notificationDetailPK != null) || (this.notificationDetailPK != null && !this.notificationDetailPK.equals(other.notificationDetailPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.NotificationDetail[ notificationDetailPK=" + notificationDetailPK + " ]";
    }

}
