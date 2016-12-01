package com.fish.idle.service.modules.sys.mapper;

import com.baomidou.mybatisplus.mapper.AutoMapper;
import com.fish.idle.service.modules.sys.entity.User;
import com.fish.idle.service.modules.sys.entity.UserRole;
import com.fish.idle.service.util.PageData;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper extends AutoMapper<User> {

}