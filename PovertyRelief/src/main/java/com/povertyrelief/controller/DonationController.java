package com.povertyrelief.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.povertyrelief.entity.Donation;
import com.povertyrelief.entity.Result.Result;
import com.povertyrelief.entity.User;
import com.povertyrelief.service.DonationService;
import com.povertyrelief.service.impl.OssService;
import com.sun.xml.internal.txw2.output.ResultFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

/**
 * <p>
 * 捐赠物 前端控制器
 * </p>
 */
@RestController
@RequestMapping("/poverty/donation")
public class DonationController {
    @Autowired
    private DonationService donationService;
    @Autowired
    private OssService ossService;

    @RequestMapping("/selectPage")
    public Result selectPage(Page<Donation> page){
        QueryWrapper<Donation> donationQueryWrapper = new QueryWrapper<>();
        QueryWrapper<Donation> wr = donationQueryWrapper.orderByDesc("id");
        IPage<Donation> donationIPage = donationService.page(page, wr);

        return Result.ok(donationIPage);
    }
    @RequestMapping("/selectById")
    public Result selectById(String id){
        Donation donation = donationService.getById(id);
        return Result.ok(donation);
    }
    @RequestMapping("/uploadCover")
    public Result uploadAvatar(MultipartFile avatarFile) {

        System.out.println(avatarFile);
        System.out.println(avatarFile.isEmpty());

        String url = ossService.upload(avatarFile);
        System.out.println(url);
        return Result.ok(url);
    }

    @RequestMapping("/insert")
    public Result insert(@RequestBody Donation donation){
        donationService.save(donation);
        return Result.ok("添加成功");
    }

    @RequestMapping("/delete")
    public Result delete(String id){
        donationService.removeById(id);
        return Result.ok("删除成功");
    }


    @RequestMapping("/adminInsert")
    public Result adminInsert(@RequestBody Donation donation){
        donationService.save(donation);
        return Result.ok("添加成功");
    }

    @RequestMapping("/update")
    public Result update(@RequestBody Donation donation){
        donationService.updateById(donation);
        return Result.ok("修改成功");
    }

}

