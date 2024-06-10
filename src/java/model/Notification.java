/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author User
 */
@Entity
@Table(name = "NOTIFICATION")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Notification.findAll", query = "SELECT n FROM Notification n"),
    @NamedQuery(name = "Notification.findByNotificationId", query = "SELECT n FROM Notification n WHERE n.notificationId = :notificationId"),
    @NamedQuery(name = "Notification.findByMessage", query = "SELECT n FROM Notification n WHERE n.message = :message"),
    @NamedQuery(name = "Notification.findByStatus", query = "SELECT n FROM Notification n WHERE n.status = :status"),
    @NamedQuery(name = "Notification.findBySender", query = "SELECT n FROM Notification n WHERE n.sender = :sender"),
        @NamedQuery(name = "Notification.findByUserNoti", query = "select new model.NotificationDisplay( n.message, s.image, n.status, n.sender , d.notificationDate"
            + ") from Notification n join n.staffId s, n.notificationDetailList d, d.users.userId u WHERE d.users.userId = :userId "),
        
    //customer service chart report
    @NamedQuery(name = "Notification.findCustomerServiceChartReport", query = "select new model.CustomerService(s.name, COUNT(n.message)) "
            + "from Notification n join n.staffId s GROUP BY s.name")
})

//public NotificationDisplay(String messsage, String image, String status, String sender, String noti_date) {
public class Notification implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "NOTIFICATION_ID")
    private Integer notificationId;
    @Size(max = 100)
    @Column(name = "MESSAGE")
    private String message;
    @Size(max = 100)
    @Column(name = "STATUS")
    private String status;
    @Size(max = 100)
    @Column(name = "SENDER")
    private String sender;
    @JoinColumn(name = "STAFF_ID", referencedColumnName = "STAFF_ID")
    @ManyToOne
    private Staff staffId;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "notification")
    private List<NotificationDetail> notificationDetailList;

    public Notification() {
    }
    
        public Notification(String message, String status, String sender, Staff staffId) {
        this.message = message;
        this.status = status;
        this.sender = sender;
        this.staffId = staffId;
    }

    public Notification(Integer notificationId) {
        this.notificationId = notificationId;
    }

    public Integer getNotificationId() {
        return notificationId;
    }

    public void setNotificationId(Integer notificationId) {
        this.notificationId = notificationId;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public Staff getStaffId() {
        return staffId;
    }

    public void setStaffId(Staff staffId) {
        this.staffId = staffId;
    }

    @XmlTransient
    public List<NotificationDetail> getNotificationDetailList() {
        return notificationDetailList;
    }

    public void setNotificationDetailList(List<NotificationDetail> notificationDetailList) {
        this.notificationDetailList = notificationDetailList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (notificationId != null ? notificationId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Notification)) {
            return false;
        }
        Notification other = (Notification) object;
        if ((this.notificationId == null && other.notificationId != null) || (this.notificationId != null && !this.notificationId.equals(other.notificationId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Notification[ notificationId=" + notificationId + " ]";
    }
    
}
