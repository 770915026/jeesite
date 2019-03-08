/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.taier.entity;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 收藏Entity
 * @author xuyongqiang
 * @version 2018-08-27
 */
public class Collect extends DataEntity<Collect> {

    private static final long serialVersionUID = 1L;
    private User user;		// 参加用户id
    private Activity activity;//活动
    public Collect() {
        super();
    }

    public Collect(String id){
        super(id);
    }

    public Activity getActivity() {
        return activity;
    }

    public void setActivity(Activity activity) {
        this.activity = activity;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
	
}