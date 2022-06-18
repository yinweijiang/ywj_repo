package com.povertyrelief.controller;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.api.R;
import com.povertyrelief.entity.Result.Result;
import com.povertyrelief.entity.User;
import com.povertyrelief.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @Version:v1.0
 * @Description: LoginController
 */
@RestController
@RequestMapping("/poverty/login")
public class LoginController {
    @Autowired
    private UserService userService;


    @RequestMapping("/isLogin")
    //@CookieValue 用于获取cookie值
    public Result isLogin(@CookieValue(value = "poverty_user",required = false) String userStr){
        JSONObject userJson = JSONObject.parseObject(userStr);
        User user = JSONObject.toJavaObject(userJson, User.class);
        if (user == null)return Result.error(101,"请先登录");
        return Result.ok("已登录");
    }

    @RequestMapping("/login")
    //获取前端传来的请求体
    public Result login(@RequestBody User user){
        //QueryWrapper：条件构造器
        QueryWrapper<User> userQueryWrapper = new QueryWrapper<>();
        //                  数据库中的列名
        userQueryWrapper.eq("username", user.getUsername());
        userQueryWrapper.eq("password",user.getPassword());
        //getOne查询一条记录
        User one = userService.getOne(userQueryWrapper);
        if (one == null){
            return Result.error(101,"账号或密码错误");
        }
        return Result.ok(one,"登录成功");
    }

    @RequestMapping("/register")
    public Result register(@RequestBody User user){
        QueryWrapper<User> userQueryWrapper = new QueryWrapper<>();
        userQueryWrapper.eq("username", user.getUsername());
        User one = userService.getOne(userQueryWrapper);
        if (one != null){
            return Result.error(102,"账号已存在");
        }
        //save：插入一条数据
        userService.save(user);
        return Result.ok("注册成功");
    }
}
