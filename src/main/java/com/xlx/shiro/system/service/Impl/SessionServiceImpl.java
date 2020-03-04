package com.xlx.shiro.system.service.Impl;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.xlx.shiro.common.util.AddressUtil;
import com.xlx.shiro.system.dto.SessionOnlineDTO;
import com.xlx.shiro.system.entity.User;
import com.xlx.shiro.system.enums.OnlineEnum;
import com.xlx.shiro.system.service.SessionService;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.DefaultSessionContext;
import org.apache.shiro.session.mgt.eis.SessionDAO;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.subject.support.DefaultSubjectContext;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * SessionService接口的实现
 *
 * @author xielx at 2020/3/4 16:17
 */
@Service("sessionService")
public class SessionServiceImpl implements SessionService {
    
    @Resource
    private SessionDAO sessionDAO;
    
    
    @Override
    public List<SessionOnlineDTO> listSession() {
        List<SessionOnlineDTO> onlineDTOList = new ArrayList<>();
        Collection<Session> activeSessions = sessionDAO.getActiveSessions();
        for (Session session : activeSessions) {
            SessionOnlineDTO sessionOnlineDTO = new SessionOnlineDTO();
            User user;
            SimplePrincipalCollection principalCollection;
            
            if (session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY) == null) {
                continue;
            }else {
                principalCollection = (SimplePrincipalCollection) session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY);
                // 获取当前登录用户信息
                user = (User) principalCollection.getPrimaryPrincipal();
                sessionOnlineDTO.setUserId(user.getUserId().toString());
                sessionOnlineDTO.setUsername(user.getUserName());
            }
            // BeanUtils.copyProperties(sessionOnlineDTO,session);
            sessionOnlineDTO.setSessionId(session.getId().toString());
            sessionOnlineDTO.setHost(session.getHost());
            sessionOnlineDTO.setStartTimestamp(session.getStartTimestamp());
            sessionOnlineDTO.setLastAccessTime(session.getLastAccessTime());
            
            long timeout = session.getTimeout();
            sessionOnlineDTO.setStatus(timeout == 0L ? OnlineEnum.OFFLINE.getNum().toString() : OnlineEnum.ONLINE.getNum().toString());
            sessionOnlineDTO.setTimeout(timeout);
           
            String address = AddressUtil.getCityInfo(sessionOnlineDTO.getHost());
            sessionOnlineDTO.setLocation(address);
            
            onlineDTOList.add(sessionOnlineDTO);
        }
        return onlineDTOList;
    }
    
    @Override
    public boolean forceLogout(String sessionId) {
        
        Session session = sessionDAO.readSession(sessionId);
        session.setTimeout(0L);
        session.stop();
        sessionDAO.delete(session);
        return true;
    }
}
