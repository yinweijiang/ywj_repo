package com.povertyrelief.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.povertyrelief.entity.PointSubsidize;
import com.povertyrelief.entity.PovertyUser;
import com.povertyrelief.entity.Result.Result;
import com.povertyrelief.entity.User;
import com.povertyrelief.entity.vo.PovertyUserAuth;
import com.povertyrelief.service.PointSubsidizeService;
import com.povertyrelief.service.PovertyUserService;
import com.povertyrelief.service.UserService;
import com.povertyrelief.utils.DateUtils;
import org.hibernate.validator.constraints.URL;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 点对点资助 前端控制器
 * </p>
 */
@RestController
@RequestMapping("/poverty/point-subsidize")
public class PointSubsidizeController {
    @Autowired
    private PointSubsidizeService pointSubsidizeService;
    @Autowired
    private UserService userService;

    @RequestMapping("/insert")
    public Result insert(@RequestAttribute User user, String id) {
        PointSubsidize pointSubsidize = new PointSubsidize();
        pointSubsidize.setSubsidizeId(user.getId());
        pointSubsidize.setUserId(id);
        pointSubsidize.setCreateTime(DateUtils.getNowDate());
        PointSubsidize one = pointSubsidizeService.getOne(new QueryWrapper<PointSubsidize>()
                .eq("user_id", id)
                .eq("subsidize_id", user.getId()));
        if (one != null) {
            return Result.ok("您已与该贫困户建立扶贫关系");
        }
        PointSubsidize one1 = pointSubsidizeService.getOne(new QueryWrapper<PointSubsidize>()
                .eq("user_id", id));
        if (one1 != null) {
            return Result.ok("该贫困户已被帮扶");
        }
        pointSubsidizeService.save(pointSubsidize);
        User byId = userService.getById(id);
        User user1 = byId.setSubsidizeId(user.getId());
        userService.update(user1, new QueryWrapper<User>().eq("id", id));
        return Result.ok("建立扶贫关系成功,请主动联系扶贫对象");
    }
}

