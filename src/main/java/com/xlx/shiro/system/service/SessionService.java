package com.xlx.shiro.system.service;

import com.xlx.shiro.system.dto.SessionOnlineDTO;

import java.util.List;

/**
 * session接口
 *
 * @author xielx at 2020/3/4 16:17
 */
public interface SessionService {
    
    /**
     * 查询所有session
     * @return List
     */
    List<SessionOnlineDTO> listSession();
    
    /**
     * 强制下线
     * @param sessionId 会话id
     * @return true:下线
     */
    boolean forceLogout(String sessionId);

}
