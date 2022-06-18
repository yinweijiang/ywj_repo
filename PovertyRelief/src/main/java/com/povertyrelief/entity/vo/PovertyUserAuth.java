package com.povertyrelief.entity.vo;

import lombok.Data;

/**
 * @Author: Wangjc
 * @Date: 2022-03-17 17:36:33
 * @Version:v1.0
 * @Description: PovertyUserAuth
 */
@Data

public class PovertyUserAuth {
    private String id;
    private String username;
    private String passwrod;
    private String tel;
    private int age;
    private String nickname;
    private String avatar;
    private String email;
    private String idCard;
    private String realName;
    private String address;
    private String userId;

    /**
     * 认证本人图片
     */
    private String picture;

    /**
     * 认证信息
     */
    private String info;

    /**
     * 认证等级
     */
    private String level;
}
