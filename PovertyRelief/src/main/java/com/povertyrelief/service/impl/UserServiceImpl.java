package com.povertyrelief.service.impl;

import com.povertyrelief.entity.User;
import com.povertyrelief.mapper.UserMapper;
import com.povertyrelief.service.UserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 贫困户 服务实现类
 * </p>
 *
 * @author Yin Weijiang
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

}
