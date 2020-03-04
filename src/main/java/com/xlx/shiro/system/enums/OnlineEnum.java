package com.xlx.shiro.system.enums;

/**
 * session状态枚举
 *
 * @author xielx at 2020/3/4 20:02
 */
public enum OnlineEnum {
    
    ONLINE(1,"在线"),
    OFFLINE(0,"下线")
    ;
    
    private Integer num;
    private String status;
    
    
    OnlineEnum(Integer num, String status) {
        this.num = num;
        this.status = status;
    }
    
    public Integer getNum() {
        return num;
    }
    
    public void setNum(Integer num) {
        this.num = num;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
}
