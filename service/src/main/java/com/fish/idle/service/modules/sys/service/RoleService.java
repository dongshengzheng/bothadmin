package com.fish.idle.service.modules.sys.service;

import com.baomidou.mybatisplus.service.IService;
import com.fish.idle.service.modules.sys.entity.Role;
import com.fish.idle.service.modules.sys.entity.RoleTree;

import java.util.List;

public interface RoleService extends IService<Role> {


    List<RoleTree> listTreeData(Integer roleId);

    void editRight(String selRes, Integer roleId);
}
