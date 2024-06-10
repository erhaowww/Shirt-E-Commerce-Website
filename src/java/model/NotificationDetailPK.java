/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;

/**
 *
 * @author User
 */
@Embeddable
public class NotificationDetailPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "NOTIFICATION_ID")
    private int notificationId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "USER_ID")
    private int userId;

    public NotificationDetailPK() {
    }

    public NotificationDetailPK(int notificationId, int userId) {
        this.notificationId = notificationId;
        this.userId = userId;
    }

    public int getNotificationId() {
        return notificationId;
    }

    public void setNotificationId(int notificationId) {
        this.notificationId = notificationId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) notificationId;
        hash += (int) userId;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof NotificationDetailPK)) {
            return false;
        }
        NotificationDetailPK other = (NotificationDetailPK) object;
        if (this.notificationId != other.notificationId) {
            return false;
        }
        if (this.userId != other.userId) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.NotificationDetailPK[ notificationId=" + notificationId + ", userId=" + userId + " ]";
    }
    
}
