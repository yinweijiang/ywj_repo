package com.povertyrelief.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.povertyrelief.entity.*;
import com.povertyrelief.entity.Result.Result;
import com.povertyrelief.entity.vo.PovertyUserAuth;
import com.povertyrelief.service.PovertyUserService;
import com.povertyrelief.service.TokenService;
import com.povertyrelief.service.UserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;

/**
 * <p>
 * 贫困户 前端控制器
 * </p>
 */
@RestController
@RequestMapping("/poverty/poverty-user")
public class PovertyUserController {
    @Autowired
    private PovertyUserService povertyUserService;
    @Autowired
    private UserService userService;
    @Autowired
    private TokenService tokenService;
//    @RequestMapping("/insert")
//    public Result insert(@RequestAttribute User user, @RequestBody PovertyUserAuth povertyUserVo){
//        user = userService.getById(user.getId());
//        PovertyUser povertyUser = new PovertyUser();
//        BeanUtils.copyProperties(povertyUserVo,povertyUser);
//        user.setRealName(povertyUserVo.getRealName());
//        user.setAddress(povertyUserVo.getAddress());
//        user.setIdCard(povertyUserVo.getIdCard());
//        povertyUser.setUserId(user.getId());
//        povertyUserService.save(povertyUser);
//        user.setAvatar(povertyUserVo.getPicture());
//        userService.update(user,new QueryWrapper<User>().eq("id", user.getId()));
//        tokenService.save(new Token().setBalance(new BigDecimal(100)).setUserId(user.getId()));
//        return Result.ok("认证成功");
//    }
    @RequestMapping("/isPoverty")
    public Result isPoverty(@RequestAttribute User user){
        PovertyUser povertyUser = povertyUserService.getOne(new QueryWrapper<PovertyUser>().eq("user_id", user.getId()));
        if (povertyUser==null){
            return Result.ok("我要认证");
        }
        return Result.ok("已认证");

    }

    @RequestMapping("/selectPage")
    public Result selectPage(Page<User> page){
        QueryWrapper<User> userQueryWrapper = new QueryWrapper<>();
        userQueryWrapper.orderByDesc("id");
        userQueryWrapper.isNotNull("id_card");
        IPage<User> userIPage = userService.page(page, userQueryWrapper);
        return Result.ok(userIPage);
    }

    @RequestMapping("/adminInsert")
    public Result adminInsert(@RequestBody PovertyUserAuth povertyUserAuth){
        User user = new User();
        user.setId(povertyUserAuth.getUserId());
        user.setRealName(povertyUserAuth.getRealName());
        user.setIdCard(povertyUserAuth.getIdCard());
        user.setAddress(povertyUserAuth.getAddress());
        userService.updateById(user);

        PovertyUser povertyUser = new PovertyUser();
        povertyUser.setUserId(povertyUserAuth.getUserId());
        povertyUser.setPicture(povertyUserAuth.getPicture());

        povertyUserService.save(povertyUser);
        tokenService.save(new Token().setBalance(new BigDecimal(100)).setUserId(povertyUserAuth.getUserId()));
        return Result.ok("认证贫困用户成功");
    }
}