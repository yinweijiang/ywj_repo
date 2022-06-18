package com.povertyrelief.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.povertyrelief.entity.StudentLoan;
import com.povertyrelief.entity.Result.Result;
import com.povertyrelief.entity.StudentLoan;
import com.povertyrelief.service.StudentLoanService;
import com.povertyrelief.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 助学贷款 前端控制器
 * </p>
 */
@RestController
@RequestMapping("/poverty/student-loan")
public class StudentLoanController {
    @Autowired
    private StudentLoanService studentLoanService;
    @RequestMapping("/getTenLoan")
    public Result getTenLoan(Page<StudentLoan> studentLoanPage) {
        IPage<StudentLoan> page = studentLoanService.page(studentLoanPage, null);
        return Result.ok(page);
    }

    @RequestMapping("/getAllLoan")
    public Result getAllLoan(Page<StudentLoan> studentLoanPage) {
        studentLoanPage.setSize(10000);
        IPage<StudentLoan> page = studentLoanService.page(studentLoanPage, null);
        return Result.ok(page);
    }


    @RequestMapping("/selectById")
    public Result selectById(String id){
        StudentLoan loan = studentLoanService.getById(id);
        return Result.ok(loan);
    }


    @RequestMapping("/selectPage")
    public Result selectPage(Page<StudentLoan> page){
        QueryWrapper<StudentLoan> studentLoanQueryWrapper = new QueryWrapper<>();
        studentLoanQueryWrapper.orderByAsc("create_time");
        IPage<StudentLoan> studentLoanIPage = studentLoanService.page(page, studentLoanQueryWrapper);
        return Result.ok(studentLoanIPage);
    }

    @RequestMapping("/insert")
    public Result insert(@RequestBody StudentLoan studentLoan){
        studentLoan.setCreateTime(DateUtils.getNowDate());
        studentLoanService.save(studentLoan);
        return Result.ok("添加成功");
    }
    @RequestMapping("/update")
    public Result update(@RequestBody StudentLoan studentLoan){
//        studentLoan.setCreateTime(DateUtils.getNowDate());
        studentLoanService.updateById(studentLoan);
        return Result.ok("添加成功");
    }

    @RequestMapping("/delete")
    public Result delete(String id){
        studentLoanService.removeById(id);
        return Result.ok("删除成功");
    }
}

