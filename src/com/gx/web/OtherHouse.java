package com.gx.web;

import com.google.gson.Gson;
import com.gx.page.Page;
import com.gx.po.*;
import com.gx.service.*;
import com.gx.util.TimeTransformation;
import com.gx.vo.DayRoomNumberVo;
import com.gx.vo.OrderDetailsVo;
import com.gx.vo.WholeOrderRoomVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.sql.Timestamp;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/OtherHouse")
public class OtherHouse {
    @Autowired
    private OrderService orderService;
    @Autowired
    private RoomSetService roomSetService;
    @Autowired
    private GuestRoomLevelService guestRoomLevelService;
    @Autowired
    private SupplierService supplierService;
    @Autowired
    private PlatformService platformService;
    @Autowired
    private AccountService accountService;
    @Autowired
    private PassengerService passengerService;

    @RequestMapping("/homeType")
    public ModelAndView homeType(@RequestParam(value = "supplierId",required = false)Integer supplierId,
            @RequestParam(value = "hometype",required = false)String hometype,
                                 @RequestParam(value = "currentPage",required = false)Integer currentPage) {
        ModelAndView mv = null;
        mv = new ModelAndView("/otherHouse/hometypeManagement");
        if (currentPage==null) {
            currentPage=1;
        }else if (currentPage==0) {
            currentPage=1;
        }
        /* List<SupplierPo> rlist=supplierService.listHaveAll();*/
        Page<guestRoomLevelPo> vo=new Page<guestRoomLevelPo>();
        vo.setCurrentPage(currentPage);
        Page<guestRoomLevelPo> list=guestRoomLevelService.pagelistother(hometype,supplierId,vo);
        String name=null;
        List<guestRoomLevelPo> glist=guestRoomLevelService.listother(name);
        /* List<guestRoomLevelPo> list=guestRoomLevelService.listwhole(hometype);*/
        List<PlatformPo> plist=platformService.listAll();
        List<AccountPo> alist=accountService.getAccount();//账户
        List<SupplierPo> slist=supplierService.listHaveAll();
        mv.addObject("plist",plist);
        mv.addObject("list",list);
        mv.addObject("glist",glist);
         mv.addObject("slist",slist);
        mv.addObject("hometype",hometype);
        mv.addObject("alist",alist);
        return mv;
    }

    @ResponseBody
    @RequestMapping("/addType")
    public Object addType(@ModelAttribute guestRoomLevelPo po,
                          @RequestParam(value = "supplierId",required = false)Integer supplierId) {
        po.setStatus(3);
        Integer count=guestRoomLevelService.inser(po);
        SupplierAndGuestPo pos =new SupplierAndGuestPo();
        pos.setgId(po.getId());
        pos.setSuId(supplierId);
        guestRoomLevelService.insertsg(pos);
        Gson gson=new Gson();
        return gson.toJson(count);
    }
    @ResponseBody
    @RequestMapping("/updateType")
    public Object updateType(@ModelAttribute guestRoomLevelPo po) {
        ModelAndView mv = null;
        Integer count=guestRoomLevelService.updateType(po);
        Gson gson=new Gson();
        return gson.toJson(count);
    }
    @RequestMapping("/roomByType")
    public ModelAndView roomByType(@RequestParam(value = "id",required = false)Integer id,
                                   @RequestParam(value = "roomNumber",required = false)String roomNumber,
                                   @RequestParam(value = "currentPage",required = false)Integer currentPage){
        ModelAndView mv = null;
        mv = new ModelAndView("/otherHouse/room");
        if (currentPage==null) {
            currentPage=1;
        }else if (currentPage==0) {
            currentPage=1;
        }
        //根据房型插房间
        Page<OrderDetailsVo> vo=new Page<OrderDetailsVo>();
        vo.setCurrentPage(currentPage);
        vo=orderService.selectRoomByType(id,roomNumber,vo);
        List<SupplierPo> slist=supplierService.listHaveAll();
        guestRoomLevelPo po=guestRoomLevelService.selectById(id);
        mv.addObject("glist",po);
        mv.addObject("slist",slist);
        mv.addObject("list",vo);
        mv.addObject("roomNumber",roomNumber);
        return mv;
    }

    //按月显示每天有几个人
    @ResponseBody
    @RequestMapping("monthRoom")
    public Object monthRoom(@RequestParam(value = "time",required = false)String time,
                            @RequestParam(value = "typeid",required = false)Integer typeid)throws Exception{
        if (time==null){
            Calendar calendar = Calendar.getInstance();
            int year = calendar.get(Calendar.YEAR);
            int month = calendar.get(Calendar.MONTH) + 1;
            int day = calendar.get(Calendar.DATE) ;
            time= year + "-" + ( month<10 ? "0" + month : month)+"-"+day;
        }
        List<DayRoomNumberVo> dayList=new ArrayList<DayRoomNumberVo>();
        DayRoomNumberVo vo=new DayRoomNumberVo();

        SimpleDateFormat sdfs = new SimpleDateFormat("yyyy-MM-dd");
        Date date2 = sdfs.parse(time);
        List<String> day=TimeTransformation.getMonthFullDay(date2);//今天起30天后的日期
        long times=0;
        //全空
        List<RoomSetPo> list=orderService.selectEmptyRoom(typeid);
        /*//查询空房
        List<RoomSetPo> lists=orderService.selectEmptyRoomByOrder(typeid);
        for (RoomSetPo r:lists){
            list.add(r);
        }*/
        Integer sum=orderService.countRoomByType(typeid);//总房间数
        for (String s:day) {
            Timestamp ts=TimeTransformation.stringTimestamp(s);
            //不全空
            List<DayRoomNumberVo> vlist = orderService.selectDayRoomType(ts, typeid);

            if (vlist.size()>0){//有入住
                vo = new DayRoomNumberVo();
                vo.setSurplus(sum-vlist.size());
                times = (new SimpleDateFormat("yyyy-MM-dd")).parse(s, new ParsePosition(0)).getTime() / 1000;
                vo.setTimes(times);
                dayList.add(vo);
            }else{//无入住
                vo = new DayRoomNumberVo();
                if (sum>0){
                    vo.setSurplus(sum);
                }else {
                    vo.setSurplus(0);
                }
                times = (new SimpleDateFormat("yyyy-MM-dd")).parse(s, new ParsePosition(0)).getTime() / 1000;
                vo.setTimes(times);
                dayList.add(vo);
            }
        }
        Gson gson=new Gson();
        return gson.toJson(dayList);
        //return mv;
    }
    //==============================================================================================================//
    @ResponseBody
    @RequestMapping("/nameYZ")
    public Object nameYZ(@ModelAttribute guestRoomLevelPo po) {
        ModelAndView mv = null;
        Integer count=guestRoomLevelService.nameYZ(po);
        Gson gson=new Gson();
        return gson.toJson(count);
    }

    @ResponseBody
    @RequestMapping("/YZ")
    public Object YZ(@RequestParam(value = "name",required = false)String name) {
        ModelAndView mv = null;
        Integer count=guestRoomLevelService.YZ(name);
        Gson gson=new Gson();
        return gson.toJson(count);
    }


    @ResponseBody
    @RequestMapping("/room")
    public Object room(@RequestParam(value = "guestId",required = false)Integer guestId) {
        ModelAndView mv = null;
      /*  List<WholeOrderRoomVo> tlist=roomSetService.selectSupplierByGuest(guestId);*/
        List<SupplierAndGuestPo> po=roomSetService.selectSupplierOther(guestId);
        List<Integer> id=new ArrayList<Integer>();
        for (SupplierAndGuestPo sg: po) {
            id.add(sg.getSuId());
        }
        List<WholeOrderRoomVo> tlist=roomSetService.selectSupplierByOther(id);
        Gson gson=new Gson();
        return gson.toJson(tlist);
    }
    @ResponseBody
    @RequestMapping("/YZdau")
    public Object YZdau(@ModelAttribute OrderPo orderPo) {
        String checkinTime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(orderPo.getCheckinTime());
        String checkoutTime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(orderPo.getCheckoutTime());
        List<String> list=TimeTransformation.cutDate("M",checkinTime,checkoutTime);
        ModelAndView mv = null;
        Integer count=0;
        for (String s:list){
            count=orderService.YZDay(s,orderPo.getRoomId());
            if (count>0){
                break;
            }
        }
        Gson gson=new Gson();
        return gson.toJson(count);
    }

    @ResponseBody
    @RequestMapping("/rommByHotelAndGuest")
    public Object rommByHotel(@RequestParam(value = "supplierId",required = false)Integer supplierId,
                              @RequestParam(value = "guestId",required = false)Integer guestId) {
        List<RoomSetPo> list=roomSetService.roomByHotelAndGuest(guestId,supplierId);
        Gson gson=new Gson();
        return gson.toJson(list);
    }
    //添加订单
    @ResponseBody
    @RequestMapping("addOrder")
    public Object add(@ModelAttribute OrderPo orderPo,
                      @RequestParam(value = "continuedRoom",required = false)Integer continuedRoom,
                      @RequestParam(value = "name",required = false)String name,
                      @RequestParam(value = "genderName",required = false)String genderName,
                      @RequestParam(value = "phoneNumber",required = false)String phoneNumber) {
        ModelAndView mv = null;
        mv = new ModelAndView("/order/accommodation");
        int count=passengerService.selectYZ(name,phoneNumber);
        int paId=1;
        if (count==0){//无用户
            PassengerPo po=new PassengerPo();
            if (genderName.equalsIgnoreCase("男")){
                po.setGenderName(31);
            }else if (genderName.equalsIgnoreCase("女")){
                po.setGenderName(32);
            }else{
                po.setGenderName(31);
            }
            po.setName(name);
            po.setPhoneNumber(phoneNumber);
            po.setTime(new Date().getTime());
            passengerService.insertAll(po);
            paId=po.getId();
        }else {
            PassengerPo po=passengerService.selectNameAndNumber(name,phoneNumber);
            paId=po.getId();
        }
        orderPo.setPassengerId(paId);
        Timestamp d = new Timestamp(System.currentTimeMillis());
        orderPo.setStatus(1);//未确认
       /* //自有房的订单
        orderPo.setType(1);*/
        //判断是否到账
        if (orderPo.getIsdao()==1){
            orderPo.setDaoTime(null);
        }else if (orderPo.getIsdao()==2){
            orderPo.setDaoTime(d);
        }
        //判断入住天数
        String strn = new SimpleDateFormat("yyyy-MM-dd").format(orderPo.getCheckinTime());
        String strn2 = new SimpleDateFormat("yyyy-MM-dd").format(orderPo.getCheckoutTime());
        int day=TimeTransformation.nDaysBetweenTwoDate(strn,strn2);
        orderPo.setCheckinDay(day);
        orderPo.setOrderTime(d);
        orderPo.setDepositSattus(0);
       orderPo.setRoomId(1);
        Integer counts=orderService.inserAll(orderPo);
        Gson gson = new Gson();
        return gson.toJson(counts);
    }

    @ResponseBody
    @RequestMapping("/update")
    public Object update(@ModelAttribute RoomSetPo roomSetPo){
        ModelAndView mv=null;
        if (roomSetPo.getSupplierID()==null){
            roomSetPo.setSupplierID(roomSetPo.getSupplierId());
        }
        Integer count=roomSetService.updateById(roomSetPo);

        Gson gson=new Gson();
        return gson.toJson(count);
    }
}
