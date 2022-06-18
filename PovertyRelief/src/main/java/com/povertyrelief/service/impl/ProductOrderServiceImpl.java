package com.povertyrelief.service.impl;

import com.povertyrelief.entity.ProductOrder;
import com.povertyrelief.mapper.ProductOrderMapper;
import com.povertyrelief.service.ProductOrderService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 购物订单 服务实现类
 * </p>
 *
 * @author Yin Weijiang
 */
@Service
public class ProductOrderServiceImpl extends ServiceImpl<ProductOrderMapper, ProductOrder> implements ProductOrderService {

}
