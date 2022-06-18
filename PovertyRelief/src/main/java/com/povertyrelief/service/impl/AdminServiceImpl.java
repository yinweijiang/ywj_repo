package com.povertyrelief.service.impl;

import com.povertyrelief.entity.Admin;
import com.povertyrelief.mapper.AdminMapper;
import com.povertyrelief.service.AdminService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 管理员 服务实现类
 * </p>
 *
 * @author Yin Weijiang
 */
@Service
public class AdminServiceImpl extends ServiceImpl<AdminMapper, Admin> implements AdminService {

}
