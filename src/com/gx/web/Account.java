package com.gx.web;

import com.google.gson.Gson;
import com.gx.page.Page;
import com.gx.po.AccountPo;
import com.gx.po.UserPo;
import com.gx.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/Account")
public class Account {
    @Autowired
    private AccountService accountService;

    @RequestMapping("/tolist")
    public ModelAndView tolist(@RequestParam(value = "currentPage",required = false)Integer currentPage,
                               @RequestParam(value = "name",required = false)String name){
        ModelAndView mv=null;
        mv=new ModelAndView("/account/accountManagement");
        Page<AccountPo> vo=new Page<AccountPo>();
        if (currentPage==null) {
            currentPage=1;
        }else if (currentPage==0) {
            currentPage=1;
        }
        vo.setCurrentPage(currentPage);
        vo=accountService.getAccountByName(name,vo);
        mv.addObject("list",vo);
        mv.addObject("name",name);
        return mv;
    }

    @ResponseBody
    @RequestMapping("/add")
    public Object add(@ModelAttribute AccountPo po){
        Integer YorN=0;
        AccountPo accountPo=accountService.selectByName(po.getName());
        if (accountPo!=null){
            if (accountPo.getStatus()==2){
                YorN=accountService.updateStatusById(accountPo.getId());//开启
            }else {
                YorN=1;
            }

        }else {
            YorN=accountService.inserAll(po);
        }
        Gson gson=new Gson();
        return gson.toJson(YorN);
    }
    @ResponseBody
    @RequestMapping("/update")
    public Object update(@ModelAttribute AccountPo po){
        Integer c=accountService.AccountById(po.getId(),po.getName());
        po.setStatus(1);
        Integer count=0;
        if (c!=0){//存在
            count=1;
        }else {
            count= accountService.updateSatus(po);
        }
        Gson gson=new Gson();
        return gson.toJson(count);
    }
    @ResponseBody
    @RequestMapping("/delete")
    public Object delete(@RequestParam(value = "id",required = false)Integer id){
     Integer count=accountService.delete(id);
        Gson gson=new Gson();
        return gson.toJson(count);
    }



}
