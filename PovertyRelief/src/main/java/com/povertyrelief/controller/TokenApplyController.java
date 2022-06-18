package com.povertyrelief.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.povertyrelief.entity.PovertyApply;
import com.povertyrelief.entity.Result.Result;
import com.povertyrelief.entity.Token;
import com.povertyrelief.entity.TokenApply;
import com.povertyrelief.entity.User;
import com.povertyrelief.service.TokenApplyService;
import com.povertyrelief.service.TokenService;
import com.povertyrelief.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 前端控制器
 * </p>
 */
@RestController
@RequestMapping("/poverty/token-apply")
public class TokenApplyController {
    @Autowired
    private TokenApplyService tokenApplyService;
    @Autowired
    private UserService userService;
    @Autowired
    private TokenService tokenService;


    @RequestMapping("/selectPage")
    public Result selectPage(Page<TokenApply> page) {
        QueryWrapper<TokenApply> tokenApplyQueryWrapper = new QueryWrapper<>();
        tokenApplyQueryWrapper.orderByDesc("id");
        tokenApplyQueryWrapper.eq("is_audit","否");
        IPage<TokenApply> povertyApplyIPage = tokenApplyService.page(page, tokenApplyQueryWrapper);
        return Result.ok(povertyApplyIPage);
    }

    @RequestMapping("/insert")
    public Result insert(TokenApply tokenApply, @RequestAttribute User user) {
        user = userService.getById(user);
        tokenApply.setUserId(user.getId());
        tokenApply.setIdCard(user.getIdCard());
        tokenApply.setRealName(user.getRealName());
        tokenApply.setAddress(user.getAddress());
        tokenApply.setIsAudit("否");
        tokenApplyService.save(tokenApply);
        return Result.ok("申请成功");
    }

    @RequestMapping("/delete")
    public Result delete(String id) {
        tokenApplyService.removeById(id);
        return Result.ok("拒绝申请并删除成功");
    }

    @RequestMapping("/audit")
    public Result audit(String id) {
        TokenApply tokenApply = tokenApplyService.getById(id);
        QueryWrapper<Token> tokenQueryWrapper = new QueryWrapper<Token>();
        tokenQueryWrapper.eq("user_id",tokenApply.getUserId());
        Token one = tokenService.getOne(tokenQueryWrapper);
        one.setBalance(one.getBalance().add(tokenApply.getMoney()));
        tokenService.updateById(one);
        tokenApply.setIsAudit("是");
        tokenApplyService.updateById(tokenApply);
        return Result.ok("审核通过");

    }


}

