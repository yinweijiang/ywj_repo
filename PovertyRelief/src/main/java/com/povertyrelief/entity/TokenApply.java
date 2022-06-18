package com.povertyrelief.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import java.math.BigDecimal;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author Yin Weijiang
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class TokenApply implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.ID_WORKER_STR)
    private String id;

    /**
     * 用户id
     */
    private String userId;

    /**
     * 申请金额
     */
    private BigDecimal money;

    /**
     * 理由
     */
    private String reason;

    /**
     * 是否通过
     */
    private String isAudit;
    private String idCard;
    private String realName;
    private String address;

}
