package com.povertyrelief.config;

import com.alibaba.fastjson.JSONObject;
import com.povertyrelief.entity.User;
import com.povertyrelief.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
//标注Spring管理的Bean

//处理器拦截器
public class LoginlogInterceptor implements HandlerInterceptor {

    //新建一个Logger对象
    Logger logger = LoggerFactory.getLogger(LoginlogInterceptor.class);
    @Autowired
    //自动装配bean
    private UserService userService;
 
    /**
     * 预处理回调方法，实现处理器的预处理
     * 返回值：true表示继续流程；false表示流程中断，不会继续调用其他的拦截器或处理器
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        Cookie[] cookies = request.getCookies();
        String userStrUrl = null;
        if(cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("poverty_user")) {
                    //存在登录状态
                    userStrUrl = cookie.getValue();
                    //指定编码格式
                    String userStr = java.net.URLDecoder.decode(userStrUrl, "UTF-8");
                    logger.info(userStr);
                    //将userStr转化为json对象
                    JSONObject userJson = JSONObject.parseObject(userStr);
                    //将userJson转化为Java对象 对象类型为User
                    User user = JSONObject.toJavaObject(userJson, User.class);
                    //在request对象中加入名为user的属性并附值为user
                    request.setAttribute("user",user);
                }
            }
        }

        return true;
    }
 
    /**
     * 后处理回调方法，实现处理器（controller）的后处理，但在渲染视图之前
     * 此时我们可以通过modelAndView对模型数据进行处理或对视图进行处理
     */
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) throws Exception {
    }
    /**
     * 整个请求处理完毕回调方法，即在视图渲染完毕时回调，
     * 如性能监控中我们可以在此记录结束时间并输出消耗时间，
     * 还可以进行一些资源清理，类似于try-catch-finally中的finally，
     * 但仅调用处理器执行链中
     */
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
 
    }
}