package com.xlx.shiro.system.controller;

import com.xlx.shiro.system.dto.ResultDTO;
import com.xlx.shiro.system.dto.SessionOnlineDTO;
import com.xlx.shiro.system.service.SessionService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Session管理
 *
 * @author xielx at 2020/3/4 16:04
 */
@Controller
public class SessionController{
    
    private Logger logger = LoggerFactory.getLogger(getClass());
    
    @Autowired
    private SessionService sessionService;
    /**
     * 跳转在线用户页面
     * @return html
     */
    @GetMapping("/session")
    @RequiresPermissions("session:list")
    public String sessionHtml(){
        return "system/monitor/online";
    }
    
    /**
     * 获取所有登录用户session
     * @return Map
     */
    @RequiresPermissions("session:list")
    @GetMapping("/session/list")
    @ResponseBody
    public Map<String,Object> list(){
        List<SessionOnlineDTO> list = sessionService.listSession();
        Map<String,Object> dataMap = new HashMap<>();
        dataMap.put("rows",list);
        dataMap.put("total",list.size());
        return dataMap;
    }
    
    /**
     * 下线
     * @param sessionId 会话id
     * @return dto
     */
    @RequiresPermissions("user:kickout")
    @GetMapping("/session/forceLogout")
    @ResponseBody
    public ResultDTO forceLogout(String sessionId){
        try{
            sessionService.forceLogout(sessionId);
        }catch (Exception e){
            logger.error("剔除用户失败:{}",e.getMessage());
            return ResultDTO.failed("强制用户下线失败");
        }
        return ResultDTO.success();
    }
    
}
