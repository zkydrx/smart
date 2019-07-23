package com.smart.sso.server.model;

import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import com.smart.mvc.model.PersistentObject;
import com.smart.sso.server.enums.TrueFalseEnum;

/**
 * 用户
 *
 * @author Joe
 */
public class User extends PersistentObject
{

    private static final long serialVersionUID = 1106412532325860697L;

    /**
     * 机构
     */
    private Integer officeId;
    /**
     * 姓名
     */
    private String name;
    /**
     * 登录名
     */
    private String account;
    /**
     * 密码
     */
    private String password;
    /**
     * 最后登录IP
     */
    private String lastLoginIp;
    /**
     * 登录总次数
     */
    private Integer loginCount = Integer.valueOf(0);
    /**
     * 最后登录时间
     */
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date lastLoginTime;
    /**
     * 创建时间
     */
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;
    /**
     * 是否启用
     */
    private Boolean isEnable = Boolean.valueOf(true);

    public Integer getOfficeId()
    {
        return officeId;
    }

    public void setOfficeId(Integer officeId)
    {
        this.officeId = officeId;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getAccount()
    {
        return account;
    }

    public void setAccount(String account)
    {
        this.account = account;
    }

    public String getPassword()
    {
        return password;
    }

    public void setPassword(String password)
    {
        this.password = password;
    }

    public String getLastLoginIp()
    {
        return lastLoginIp;
    }

    public void setLastLoginIp(String lastLoginIp)
    {
        this.lastLoginIp = lastLoginIp;
    }

    public Integer getLoginCount()
    {
        return loginCount;
    }

    public void setLoginCount(Integer loginCount)
    {
        this.loginCount = loginCount;
    }

    public Date getLastLoginTime()
    {
        return lastLoginTime;
    }

    public void setLastLoginTime(Date lastLoginTime)
    {
        this.lastLoginTime = lastLoginTime;
    }

    public Date getCreateTime()
    {
        return createTime;
    }

    public void setCreateTime(Date createTime)
    {
        this.createTime = createTime;
    }

    public Boolean getIsEnable()
    {
        return isEnable;
    }

    public void setIsEnable(Boolean isEnable)
    {
        this.isEnable = isEnable;
    }

    public String getIsEnableStr()
    {
        return (isEnable != null && isEnable) ? TrueFalseEnum.TRUE.getLabel() : TrueFalseEnum.FALSE.getLabel();
    }
}
