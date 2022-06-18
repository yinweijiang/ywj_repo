package com.povertyrelief.controller;


import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.povertyrelief.entity.Admin;
import com.povertyrelief.entity.Result.Result;
import com.povertyrelief.service.AdminService;
import org.apache.http.Consts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * <p>
 * 管理员 前端控制器
 * </p>
 */

//使用这个注解，我们返回的数据会以 JSON 格式自动返回给前端
@RestController
//这个注解表示配置请求的路径，我们没有指定请求方法，所以任何方法都可以接受
@RequestMapping("/poverty/admin")
public class AdminController {
    @Autowired
    private AdminService adminService;

    @RequestMapping(value = "/login")
    public Result loginStatus(HttpServletRequest request, HttpSession session){
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        QueryWrapper<Admin> adminQueryWrapper = new QueryWrapper<Admin>();
        adminQueryWrapper.eq("username",name);
        adminQueryWrapper.eq("password",password);
        Admin one = adminService.getOne(adminQueryWrapper);

        if(one!=null){
            session.setAttribute("poverty_admin",one);
            return Result.ok(one);
        }
        return Result.error(101,"用户名或密码错误");
    }
}

