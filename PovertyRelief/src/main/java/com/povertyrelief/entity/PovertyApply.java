package com.povertyrelief.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
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
public class PovertyApply implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.ID_WORKER_STR)
    private String id;

    private String userId;

    private String realName;

    private String idCard;

    private String address;

    private String picture;

    private String detail;

    /**
     * 是否通过
     */
    private String isAudit;


}
