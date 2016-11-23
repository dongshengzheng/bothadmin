package com.fish.idle.service.util;

import com.baomidou.mybatisplus.annotations.IdType;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.ConfigGenerator;

public class CustomGenerator {
    public static void main(String[] args) {
        ConfigGenerator cg = new ConfigGenerator();
        // 配置 MySQL 连接
        cg.setDbDriverName("com.mysql.jdbc.Driver");
        cg.setDbUser("root");
        cg.setDbPassword("root");
        cg.setDbUrl("jdbc:mysql://127.0.0.1:3306/jsdd?characterEncoding=utf8");
        // 配置包名
        cg.setEntityPackage("com.fish.idle.service.entity");
        cg.setMapperPackage("com.fish.idle.service.mapper");
        cg.setServicePackage("com.fish.idle.service.service");
        cg.setXmlPackage("com.fish.idle.service.mapper.xml");
        cg.setServiceImplPackage("com.fish.idle.service.service.impl");

        // 配置表主键策略
        cg.setIdType(IdType.AUTO);

        // 配置保存路径
        cg.setSaveDir("/Users/sunhan/Workspace/project/jsdd/service/src");
        // 其他参数请根据上面的参数说明自行配置，当所有配置完善后，运行AutoGenerator.run()方法生成Code
        // 生成代码
        AutoGenerator.run(cg);
    }
}
