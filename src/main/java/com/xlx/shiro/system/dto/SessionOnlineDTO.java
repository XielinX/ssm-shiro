package com.xlx.shiro.system.dto;

import java.io.Serializable;
import java.util.Date;

/**
 * session
 *
 * @author xielx at 2020/3/4 16:19
 */
public class SessionOnlineDTO implements Serializable {
    /**
     * sessionId
     */
    private String sessionId;
    /**
     * 用户id
     */
    private String userId;

    /**
     * 用户名称
     */
    private String username;

    /**
     * 用户主机地址
     */
    private String host;

    /**
     * 电脑登录的IP
     */
    private String systemHost;

    /**
     * 状态
     */
    private String status;

    /**
     * session创建时间
     */
    private Date startTimestamp;
    /**
     * session最后访问时间
     */
    private Date lastAccessTime;
    /**
     * 超时时间
     */
    private Long timeout;
    /**
     * 所在地
     */
    private String location;
    
    
    
    
    public String getSessionId() {
        return sessionId;
    }
    
    public void setSessionId(String sessionId) {
        this.sessionId = sessionId;
    }
    
    public String getUserId() {
        return userId;
    }
    
    public void setUserId(String userId) {
        this.userId = userId;
    }
    
    public String getUsername() {
        return username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    
    public String getHost() {
        return host;
    }
    
    public void setHost(String host) {
        this.host = host;
    }
    
    public String getSystemHost() {
        return systemHost;
    }
    
    public void setSystemHost(String systemHost) {
        this.systemHost = systemHost;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    
    public Date getStartTimestamp() {
        return startTimestamp;
    }
    
    public void setStartTimestamp(Date startTimestamp) {
        this.startTimestamp = startTimestamp;
    }
    
    public Date getLastAccessTime() {
        return lastAccessTime;
    }
    
    public void setLastAccessTime(Date lastAccessTime) {
        this.lastAccessTime = lastAccessTime;
    }
    
    public Long getTimeout() {
        return timeout;
    }
    
    public void setTimeout(Long timeout) {
        this.timeout = timeout;
    }
    
    public String getLocation() {
        return location;
    }
    
    public void setLocation(String location) {
        this.location = location;
    }
    
    
    
}
