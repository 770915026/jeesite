package com.thinkgem.jeesite.modules.front.frontUtils;

import java.util.HashMap;

public class MessageData {

    private int code;
    private String status;
    private HashMap msg = new HashMap();

    public static MessageData success(){
        MessageData message = new MessageData();
        message.code=200;
        message.status="操作成功";
       return message;
    }
    public static MessageData failed(){
        MessageData message = new MessageData();
        message.code=400;
        message.status="操作失败";
        return message;
    }
    public MessageData addMsg(String str,Object object){
        this.msg.put(str,object);
        return this;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public HashMap getHashMap() {
        return msg;
    }

    public void setHashMap(HashMap hashMap) {
        this.msg = hashMap;
    }
}
