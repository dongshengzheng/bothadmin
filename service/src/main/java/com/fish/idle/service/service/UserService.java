package com.fish.idle.service.service;

import com.fish.idle.service.util.PageData;
import java.util.List;

/**
 * Created by dongs on 2016/11/21.
 */
public interface UserService {
    void setSKIN(PageData pd);
    void saveIP(PageData pd);

    PageData getUserByNameAndPwd(PageData pd);

    void updateLastLogin(PageData pd);

    PageData list(PageData pd);

    void add(PageData pd);

    PageData getById(Integer userId);

    void edit(PageData pd);
    
    void delete(Integer userId);

    void batchDelete(String ids);

    List<PageData> getRoles(Integer userId);

    List<PageData> getAllRoles();

    void editRole(PageData pd);

    boolean isNameExist(PageData pd);
    
    PageData editPassword(PageData pd);
}
