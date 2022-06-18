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
 * 捐赠物
 * </p>
 *
 * @author Yin Weijiang
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class Donation implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.ID_WORKER_STR)
    private String id;

    /**
     * 商品名称
     */
    private String title;

    /**
     * 库存
     */
    private Integer stock;

    /**
     * 详情
     */
    private String detail;

    /**
     * 发布用户id
     */
    private String donateUserId;

    /**
     * 价格(使用贫困代码购买)
     */
    private BigDecimal price;

    private String cover;


}
