package com.gx.service.impl;

import com.gx.dao.AccountDao;
import com.gx.page.Page;
import com.gx.po.AccountPo;
import com.gx.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Transactional
@Service("AccountService")
public class AccountServiceImpl implements AccountService {
    @Autowired
    private AccountDao accountDao;
    @Override
    public List<AccountPo> getAccount() {
        return accountDao.list();
    }

    @Override
    public Integer inserAll(AccountPo accountPo) {
        return accountDao.inserAll(accountPo);
    }

    @Override
    public Integer updateSatus(AccountPo po) {
        return accountDao.updateById(po);
    }

    @Override
    public Integer delete(Integer id) {
        return accountDao.deleteAccount(id);
    }

    @Override
    public Page<AccountPo> getAccountByName(String name, Page<AccountPo> vo) {
        int start=0;
        if (vo.getCurrentPage()>1) {
            start=(vo.getCurrentPage()-1)*vo.getPageSize();
        }
        List<AccountPo> list=accountDao.pageFuzzyselect(name,start, vo.getPageSize());
        vo.setResult(list);
        int count=accountDao.countFuzzyselect(name);
        vo.setTotal(count);
        vo.setTotalPage(vo.getTotal()%vo.getPageSize() != 0 ?vo.getTotal()/vo.getPageSize() + 1 : vo.getTotal()/vo.getPageSize());
        return vo;
    }

    @Override
    public Integer selectYZ(String name) {
        return accountDao.selectYZ(name);
    }

    @Override
    public AccountPo selectByName(String name) {
        return accountDao.selectByName(name);
    }

    @Override
    public Integer updateStatusById(Integer id) {
        return accountDao.updateStatusById(id);
    }

    @Override
    public Integer AccountById(Integer id, String name) {
        return accountDao.AccountById(id, name);
    }
}
