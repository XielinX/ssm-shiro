package com.xlx.shiro.exception;

/**
 * @author: xielx on 2019/7/13
 */
public enum CustomizeExceptionEnum implements ICustomizeException{

  NETWORK_ERROR(1001, "网络错误请重试"),
  AUTHENTICATION_ERROR(1002,"用户名或密码错误"),
  LOCKED_ACCOUNT_ERROR(1003,"帐号被锁,请联系管理员"),
  ;


  private Integer code;
  private String message;

  CustomizeExceptionEnum(Integer code,String message){
    this.code = code;
    this.message = message;
  }
  @Override
  public Integer getCode() {
    return this.code;
  }

  @Override
  public String getMessage() {
    return this.message;
  }
}
