package com.povertyrelief.service.impl;

import com.povertyrelief.entity.Token;
import com.povertyrelief.mapper.TokenMapper;
import com.povertyrelief.service.TokenService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 代币 服务实现类
 * </p>
 *
 * @author Yin Weijiang
 */
@Service
public class TokenServiceImpl extends ServiceImpl<TokenMapper, Token> implements TokenService {

}
