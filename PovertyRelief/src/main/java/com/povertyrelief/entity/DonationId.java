package com.povertyrelief.entity;

import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 捐赠物订单
 * </p>
 *
 * @author Yin Weijiang
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class DonationId implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.ID_WORKER_STR)
    private String id;

    /**
     * 购买用户id
     */
    private String userId;

    /**
     * 捐赠物id
     */
    private String donationId;

    /**
     * 分数
     */
    private Integer copies;

    /**
     * 价格
     */
    private BigDecimal price;

    /**
     * 总价
     */
    private BigDecimal totalPrice;

    /**
     * 收货地址
     */
    private String peopleAddress;

    /**
     * 收货人姓名
     */
    private String peopleName;

    /**
     * 收货人电话
     */
    private String peopleTel;


}
