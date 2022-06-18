package com.povertyrelief.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.povertyrelief.entity.Result.Result;
import com.povertyrelief.entity.Token;
import com.povertyrelief.service.TokenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 代币 前端控制器
 * </p>
 */
@RestController
@RequestMapping("/poverty/token")
public class TokenController {
    @Autowired
    private TokenService tokenService;

    @RequestMapping("/selectById")
    public Result selectById(String id){
        Token token = tokenService.getOne(new QueryWrapper<Token>().eq("user_id", id));
        return Result.ok(token);
    }
    @RequestMapping("/update")
    public Result update(@RequestBody Token token){
        tokenService.updateById(token);
        return Result.ok("修改成功");
    }

}

