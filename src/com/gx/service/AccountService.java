package com.gx.service;

import com.gx.page.Page;
import com.gx.po.AccountPo;

import java.util.List;

public interface AccountService {

    public List<AccountPo> getAccount();

    public Integer inserAll(AccountPo accountPo);
    public Integer updateSatus(AccountPo po);

    public Integer delete(Integer id);

    public Page<AccountPo> getAccountByName(String name, Page<AccountPo> vo);
    public Integer selectYZ(String name);
    public AccountPo selectByName( String name);
    public Integer updateStatusById(Integer id);
    public Integer AccountById(Integer id,String name);
}
