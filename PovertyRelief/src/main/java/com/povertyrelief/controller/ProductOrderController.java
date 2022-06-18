package com.povertyrelief.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.povertyrelief.entity.*;
import com.povertyrelief.entity.Result.Result;
import com.povertyrelief.service.ProductOrderService;
import com.povertyrelief.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.ParameterMapper;
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
@RequestMapping("/poverty/product-order")
public class ProductOrderController {
    @Autowired
    private ProductOrderService productOrderService;
    @Autowired
    private ProductService productService;

    @RequestMapping("/buy")
    public Result buy(@RequestAttribute User user, @RequestBody ProductOrder productOrder) {
        //判断是否登录
        if (user == null) {
            return Result.error(100, "请先登录");
        }
        //修改商品余额
        Product product = new Product();
        product.setId(productOrder.getProductId());
        product = productService.getById(product.getId());
        product.setStock(product.getStock() - productOrder.getCopies());
        productService.update(product,new QueryWrapper<Product>().eq("id",product.getId()));
        //保存订单
        productOrder.setUserId(user.getId());
        productOrderService.save(productOrder);
        return Result.ok(null);
    }

    @RequestMapping("/selectPage")
    public Result selectPage(Page<ProductOrder> page , @RequestAttribute User user){
        QueryWrapper<ProductOrder> productOrderQueryWrapper = new QueryWrapper<>();
        productOrderQueryWrapper.eq("user_id",user.getId());
        IPage<ProductOrder> orderPage = productOrderService.page(page, productOrderQueryWrapper);
        return Result.ok(orderPage);
    }

    @RequestMapping("/selectPageAdmin")
    public Result selectPageAdmin(Page<ProductOrder> page){
        QueryWrapper<ProductOrder> productOrderQueryWrapper = new QueryWrapper<>();
        productOrderQueryWrapper.orderByAsc("id");
        IPage<ProductOrder> orderPage = productOrderService.page(page, productOrderQueryWrapper);
        return Result.ok(orderPage);
    }
    @RequestMapping("/delete")
    public Result delete(String id){
        productOrderService.removeById(id);
        return Result.ok("删除成功");
    }
}

