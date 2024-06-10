/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;
import javax.annotation.Resource;
import javax.persistence.*;

public class UsersService {
    
    @PersistenceContext
    EntityManager mgr;
    @Resource
    Query query;
    
    
     public UsersService(EntityManager mgr) {
        this.mgr = mgr;
    }

    public boolean addItem(Users users) {
        mgr.persist(users);
        return true;
    }
    
    public Users findItemByCode(String code) {
        Users users = mgr.find(Users.class, code);
        return users;
    }

          public Users Search(int id){
         Users users = mgr.find(Users.class, id);     
        return users;
    }

    public List<Users> findAll() {
        List userstList = mgr.createNamedQuery("Users.findAll").getResultList();
        return userstList;
    }
    
        public List<Users> findByUserId(int userId) {
        List userstList = mgr.createNamedQuery("Users.findByUserId").setParameter("userId", userId).getResultList();
        return userstList;
    }
    
       public boolean updateItem(Users user) {
        Users u = Search(user.getUserId());
        if (u != null) {
            u.setName(user.getName());
             u.setImage(user.getImage());
              u.setPhoneNum(user.getPhoneNum());
             u.setEmail(user.getEmail());

            return true;
        }
        return false;
    }
    
       
       public boolean updateNoImage(Users user) {
        Users u = Search(user.getUserId());
        if (u != null) {
            u.setName(user.getName());

              u.setPhoneNum(user.getPhoneNum());
             u.setEmail(user.getEmail());
            return true;
        }
        return false;
    }
       
             public boolean updateChangePss(Users user) {
        Users u = Search(user.getUserId());
        if (u != null) {
            u.setPassword(user.getPassword());
            return true;
        }
        return false;
    }
    
     public boolean deleteItem(String code) {
        Users users = findItemByCode(code);
        if (users != null) {
            mgr.remove(users);
            return true;
        }
        return false;
    }


//    public boolean updateItem(Users users) {
//        Users tempItem = findItemByCode(users.getCode());
//        if (tempItem != null) {
//            tempItem.setDescription(users.getDescription());
//            tempItem.setPrice(item.getPrice());
//            return true;
//        }
//        return false;
//    }
    
}
