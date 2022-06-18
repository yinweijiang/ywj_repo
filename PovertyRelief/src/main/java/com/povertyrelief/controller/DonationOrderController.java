package com.povertyrelief.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.povertyrelief.entity.*;
import com.povertyrelief.entity.Result.Result;
import com.povertyrelief.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;

/**
 * <p>
 * 购物订单 前端控制器
 * </p>
 */
@RestController
@RequestMapping("/poverty/donation-order")
public class DonationOrderController {
    @Autowired
    private DonationOrderService donationOrderService;
    @Autowired
    TokenService tokenService;
    @Autowired
    private UserService userService;
    @Autowired
    private DonationService donationService;
    @Autowired
    private PovertyUserService povertyUserService;

    @RequestMapping("/buy")
    public Result buy(@RequestAttribute User user, @RequestBody DonationOrder donationOrder) {
        //判断是否登录
        if (user == null) {
            return Result.error(100, "请先登录");
        }
        //判断是否为贫困用户
        QueryWrapper<PovertyUser> povertyUserQueryWrapper = new QueryWrapper<>();
        povertyUserQueryWrapper.eq("user_id",user.getId());
        PovertyUser poverty = povertyUserService.getOne(povertyUserQueryWrapper);
        if (poverty==null){
            return Result.error(102, "当前用户不为贫困用户,请先认证");
        }

        QueryWrapper<Token> wrapper = new QueryWrapper<>();
        wrapper.eq("user_id", user.getId());
        Token token = tokenService.getOne(wrapper);
        BigDecimal balance = token.getBalance();
        if (donationOrder.getTotalPrice().compareTo(balance) > -1) {
            return Result.error(101, "余额不足");
        }
        token.setBalance(token.getBalance().subtract(donationOrder.getTotalPrice()));
        tokenService.update(token,wrapper);
        donationOrder.setUserId(user.getId());
        donationOrderService.save(donationOrder);
        return Result.ok(null);
    }


    @RequestMapping("/selectPage")
    public Result selectPage(Page<DonationOrder> page ,@RequestAttribute User user){
        QueryWrapper<DonationOrder> donationOrderQueryWrapper = new QueryWrapper<>();
        donationOrderQueryWrapper.eq("user_id",user.getId());
        IPage<DonationOrder> orderPage = donationOrderService.page(page, donationOrderQueryWrapper);
        return Result.ok(orderPage);
    }


    @RequestMapping("/selectPageAdmin")
    public Result selectPageAdmin(Page<DonationOrder> page){
        QueryWrapper<DonationOrder> donationOrderQueryWrapper = new QueryWrapper<>();
        donationOrderQueryWrapper.orderByAsc("id");
        IPage<DonationOrder> orderPage = donationOrderService.page(page, donationOrderQueryWrapper);
        return Result.ok(orderPage);
    }
    @RequestMapping("/delete")
    public Result delete(String id){
        donationOrderService.removeById(id);
        return Result.ok("删除成功");
    }
}