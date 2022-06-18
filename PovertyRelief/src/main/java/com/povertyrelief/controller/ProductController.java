package com.povertyrelief.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.povertyrelief.entity.Donation;
import com.povertyrelief.entity.Product;
import com.povertyrelief.entity.Result.Result;
import com.povertyrelief.entity.User;
import com.povertyrelief.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 商品 前端控制器
 * </p>
 */
@RestController
@RequestMapping("/poverty/product")
public class ProductController {
    @Autowired
    private ProductService productService;
    @RequestMapping("/selectPage")
    public Result selectPage(Page<Product> page){
        QueryWrapper<Product> productQueryWrapper = new QueryWrapper<>();
        productQueryWrapper.orderByDesc("id");
        /**
         * EQ	equal	等于
         * NE	not equal	不等于
         * GT	granter than	大于
         * LT	less than	小于
         * GE	granter than or equal	大于等于
         * LE	less than or equal	小于等于
         */
        productQueryWrapper.gt("stock",0);
        productQueryWrapper.orderByDesc("id");
        IPage<Product> productIPage = productService.page(page, productQueryWrapper);

        return Result.ok(productIPage);
    }
    @RequestMapping("/selectById")
    public Result selectById(String id){
        Product product = productService.getById(id);
        return Result.ok(product);
    }
    @RequestMapping("/insert")
    public Result insert(@RequestAttribute User user, @RequestBody Product product){
        product.setReleaseUserId(user.getId());
        productService.save(product);
        return Result.ok("添加成功");
    }
    @RequestMapping("/adminInsert")
    public Result adminInsert( @RequestBody Product product){
        productService.save(product);
        return Result.ok("添加成功");
    }

    @RequestMapping("/delete")
    public Result delete(String id){
        productService.removeById(id);
        return Result.ok("删除成功");
    }

    @RequestMapping("/update")
    public Result update(@RequestBody Product product){
        productService.updateById(product);
        return Result.ok("修改成功");
    }

}

