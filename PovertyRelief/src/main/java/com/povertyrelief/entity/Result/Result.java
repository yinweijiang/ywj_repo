package com.povertyrelief.entity.Result;

import lombok.AllArgsConstructor;
import lombok.Data;

// 统一结果返回类
@Data
@AllArgsConstructor
public class Result {
    //标识返回的状态码
    private Integer code;
    //标识返回的信息
    private String message;
    //标识返回的数据
    private Object data;

    //私有化，防止new
    private Result() {  }

    //传2个值使用该方法
    //成功
    public static Result ok(Object data, String message) {
        return new Result(200, message, data);
    }

    //传单值执行该方法
    //成功返回 重载 message没有特别要求
    public static Result ok(Object data) {
        return Result.ok(data, "Success");
    }

    // 失败
    public static Result error(Integer code, String message) {
        return new Result(code, message, "");
    }
}
