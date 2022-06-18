package com.povertyrelief.service.impl;

import com.povertyrelief.entity.Product;
import com.povertyrelief.mapper.ProductMapper;
import com.povertyrelief.service.ProductService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 商品 服务实现类
 * </p>
 *
 * @author Yin Weijiang
 */
@Service
public class ProductServiceImpl extends ServiceImpl<ProductMapper, Product> implements ProductService {

}
