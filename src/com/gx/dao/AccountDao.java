package com.gx.dao;

import com.gx.po.AccountPo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AccountDao {
    public List<AccountPo> list();

    public Integer inserAll(AccountPo accountPo);
    public Integer updateById(AccountPo po);

    public Integer deleteAccount(Integer id);

    public List<AccountPo> pageFuzzyselect(@Param("name") String name,@Param("start") int start, @Param("size") int size);
    public Integer countFuzzyselect(@Param("name") String name);

    public Integer selectYZ(@Param("name") String name);

    public AccountPo selectByName(@Param("name") String name);

    public Integer updateStatusById(Integer id);

    public Integer AccountById(@Param("id") Integer id,@Param("name") String name);
}
