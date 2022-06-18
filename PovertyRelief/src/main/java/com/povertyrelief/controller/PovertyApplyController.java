package com.povertyrelief.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.povertyrelief.entity.PovertyApply;
import com.povertyrelief.entity.PovertyUser;
import com.povertyrelief.entity.Result.Result;
import com.povertyrelief.entity.Token;
import com.povertyrelief.entity.User;
import com.povertyrelief.entity.vo.PovertyUserAuth;
import com.povertyrelief.service.PovertyApplyService;
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
 *  前端控制器
 * </p>
 */
@RestController
@RequestMapping("/poverty/poverty-apply")
public class PovertyApplyController {
    @Autowired
    private PovertyApplyService povertyApplyService;
    @Autowired
    private PovertyUserService povertyUserService;
    @Autowired
    private UserService userService;
    @Autowired
    private TokenService tokenService;

    @RequestMapping("/insert")
    public Result insert(@RequestAttribute User user, @RequestBody PovertyUserAuth povertyUserVo){

        PovertyApply povertyApply1 = povertyApplyService.getOne(new QueryWrapper<PovertyApply>().eq("user_id", user.getId())
                .eq("is_audit","否"));
        if (povertyApply1!=null){
            return Result.ok("您已提交过审核信息,请勿重复提交");
        }

        PovertyApply povertyApply = new PovertyApply();

        povertyApply.setRealName(povertyUserVo.getRealName());
        povertyApply.setAddress(povertyUserVo.getAddress());
        povertyApply.setIdCard(povertyUserVo.getIdCard());
        povertyApply.setUserId(user.getId());
        povertyApply.setPicture(povertyUserVo.getPicture());
        povertyApply.setIsAudit("否");
        povertyApply.setDetail(povertyUserVo.getInfo());
        povertyApplyService.save(povertyApply);

        return Result.ok("申请审核成功");
    }

    @RequestMapping("/selectPage")
    public Result selectPage(Page<PovertyApply> page){
        QueryWrapper<PovertyApply> povertyApplyQueryWrapper = new QueryWrapper<>();
        povertyApplyQueryWrapper.orderByDesc("id");
        povertyApplyQueryWrapper.eq("is_audit","否");
        IPage<PovertyApply> povertyApplyIPage = povertyApplyService.page(page, povertyApplyQueryWrapper);
        return Result.ok(povertyApplyIPage);
    }

    @RequestMapping("/delete")
    public Result delete(String id){
        povertyApplyService.removeById(id);
        return Result.ok("拒绝申请并删除成功");
    }

    @RequestMapping("/audit")
    public Result audit(String id){
        PovertyApply povertyApply = povertyApplyService.getById(id);
        povertyApply.setIsAudit("是");
        povertyApplyService.updateById(povertyApply);
        User user = new User();
        user.setId(povertyApply.getUserId());
        user.setRealName(povertyApply.getRealName());
        user.setIdCard(povertyApply.getIdCard());
        user.setAddress(povertyApply.getAddress());
        userService.updateById(user);

        PovertyUser povertyUser = new PovertyUser();
        povertyUser.setUserId(povertyApply.getUserId());
        povertyUser.setPicture(povertyApply.getPicture());

        povertyUserService.save(povertyUser);
        tokenService.save(new Token().setBalance(new BigDecimal(100)).setUserId(povertyApply.getUserId()));
        return Result.ok("认证贫困用户成功");
    }
}

