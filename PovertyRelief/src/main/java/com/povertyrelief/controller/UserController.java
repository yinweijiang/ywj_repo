package com.povertyrelief.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.povertyrelief.entity.DonationOrder;
import com.povertyrelief.entity.PovertyUser;
import com.povertyrelief.entity.Result.Result;
import com.povertyrelief.entity.Token;
import com.povertyrelief.entity.User;
import com.povertyrelief.service.PovertyUserService;
import com.povertyrelief.service.TokenService;
import com.povertyrelief.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 * 贫困户 前端控制器
 * </p>
 */
@RestController
@RequestMapping("/poverty/user")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private PovertyUserService povertyUserService;
    @Autowired
    private TokenService tokenService;
//
//    @PostMapping("/selectById")
//    public Result selectById(@RequestAttribute User user) {
//        User user1 = userService.getById(user.getId());
//        PovertyUser povertyUser = povertyUserService.getOne(new QueryWrapper<PovertyUser>().eq("user_id", user.getId()));
//
//        Map<String, Object> stringObjectHashMap = new HashMap<>();
//        stringObjectHashMap.put("user", user1);
//        stringObjectHashMap.put("povertyUser", povertyUser);
//
//        return Result.ok(stringObjectHashMap);
//    }
//
    @RequestMapping("/selectById")
    public Result selectByIdGet(String id) {
        User user1 = userService.getById(id);
        PovertyUser povertyUser = povertyUserService.getOne(new QueryWrapper<PovertyUser>().eq("user_id", id));

        Map<String, Object> stringObjectHashMap = new HashMap<>();
        stringObjectHashMap.put("user", user1);
        stringObjectHashMap.put("povertyUser", povertyUser);

        return Result.ok(stringObjectHashMap);
    }

    @RequestMapping("/selectByPage")
    public Result selectPage(Page<User> page) {
        QueryWrapper<User> userQueryWrapper = new QueryWrapper<>();
        IPage<User> userIPage = userService.page(page, userQueryWrapper);
        return Result.ok(userIPage);
    }

    @RequestMapping("/delete")
    public Result delete(String id) {
        userService.removeById(id);
        tokenService.remove(new QueryWrapper<Token>().eq("user_id", id));
        povertyUserService.remove(new QueryWrapper<PovertyUser>().eq("user_id", id));
        return Result.ok("删除成功");
    }

    @RequestMapping("/insert")
    public Result register(@RequestBody User user) {
        QueryWrapper<User> userQueryWrapper = new QueryWrapper<>();
        userQueryWrapper.eq("username", user.getUsername());
        User one = userService.getOne(userQueryWrapper);
        if (one != null) {
            return Result.error(102, "账号已存在");
        }
        userService.save(user);
        return Result.ok("添加成功");
    }

    @RequestMapping("/update")
    public Result update(@RequestBody User user) {
        QueryWrapper<User> userQueryWrapper = new QueryWrapper<>();
        userQueryWrapper.eq("id", user.getId());
        userService.update(user, userQueryWrapper);
        return Result.ok("修改成功");
    }

    @RequestMapping("/cancelPoverty")
    public Result cancelPoverty(String id) {
        User user = userService.getById(id);
        user.setIdCard("");
        user.setRealName("");
        user.setAddress("");
        user.setSubsidizeId("");
        userService.updateById(user);
        tokenService.remove(new QueryWrapper<Token>().eq("user_id", id));
        povertyUserService.remove(new QueryWrapper<PovertyUser>().eq("user_id", id));
        return Result.ok("取消贫困户成功");
    }

    @RequestMapping("/getInfo")
    public Result getInfo(@RequestAttribute User user) {
        User user1 = userService.getById(user.getId());
        return Result.ok(user1);
    }

    @RequestMapping("/updatePassword")
    public Result updatePassword(@RequestAttribute User user, String oldPassword, String newPassword) {
        if (!user.getPassword().equals(oldPassword)) {
            return Result.error(102, "旧密码错误");
        }
        user.setPassword(newPassword);
        userService.updateById(user);
        return Result.ok("修改密码成功");
    }
}