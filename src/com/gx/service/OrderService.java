package com.gx.service;

import com.gx.page.Page;
import com.gx.po.OrderPo;
import com.gx.po.RoomSetPo;
import com.gx.vo.*;
import com.gx.web.Order;
import org.apache.ibatis.annotations.Param;
import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.List;

public interface OrderService {

    //添加订单
    @Transactional
    public Integer inserAll(OrderPo orderPo);
        //已确认
    public Page<OrderDetailsVo> list(String orderNumber, String passengerId, Page<OrderDetailsVo> vo);
    //已入住
    public Page<OrderDetailsVo> checkinorder(String orderNumber, String passengerId, Page<OrderDetailsVo> vo);
    //已退房
    public Page<OrderDetailsVo> checkoutorder(String orderNumber, String passengerId, Page<OrderDetailsVo> vo);
    //已到款
    public Page<OrderDetailsVo> myaccount(String orderNumber, String passengerId, Page<OrderDetailsVo> vo);

    /*//修改订单状态
    @Transactional
    public Integer updateStatus(String orderNumber, Integer status);
   //根据订单号查询订单
    public OrderPo selectByOrderNumber(String orderNumber);*/
    //根据订单号查询订单
    public OrderPo selectByOrderNumber(String orderNumber);
    //修改订单状态
    @Transactional
    public Integer updateStatus(Integer id, Integer status);
  public OrderDetailsVo selectById(Integer id);
    //查询已确认订单
    public Page<OrderDetailsVo> selectCheckinList(String orderNumber, Integer passengerId,long time, Page<OrderDetailsVo> vo);

    //查询订单明细
    public Page<OrderDetailsVo> selectOrderDetail(String orderNumber,Page<OrderDetailsVo> vo);

    public Page<OrderDetailsVo> financial(long startTime,long endTime,Page<OrderDetailsVo> vo);

    //验证订单号是否存在
   public Integer codeNumberYZ(String orderNumber);

    public Page<OrderTimeVo> selectRoomByTime(Timestamp time, Page<OrderTimeVo> vo);

    public List<IndayVo> checkinDay(String time, Integer roomId);
    @Transactional
    public Integer updateMoney(Integer id,Timestamp time);


    public Page<OrderTimeVo> selectRoomPage( Page<OrderTimeVo> vo);
  public List<OrderTimeVo> selectRoom();
    public List<OrderTimeVo> selectRoomByTimes(Timestamp time,List<Integer> list);
    public List<OrderTimeVo> selectRoomByin(List<Integer> idList,List<Integer> list);

    public List<DayRoomNumberVo> selectDayRoom(String time, Integer roomId);

    public List<OrderTimeVo> selectRooms();

    List<OrderTimeVo> selectRoomByins(List<Integer> allList);

    public Integer updateInEnd(String start,String end,Integer id);
/////////////////////////////////////////////////////////////////////////////////////////////////////

    public Page<OrderDetailsVo> allContractOrder(String name,String orderNumber,Page<OrderDetailsVo> vo);

     public List<OrderDetailsVo> fianceorder(Integer roomId,String time);

    public List<OrderDetailsVo> fianceordertime(Integer roomId,String time);

    public Integer roomAcountu(Integer roomId);

    public List<IndayVo> updateCheckDay(String time,Integer roomId,Integer id);

    public Integer updateAll(OrderPo po);

    ///==================================整租============================================================================
    public Page<OrderDetailsVo> selectRoomByType(Integer id,String roomNumber,Page<OrderDetailsVo> vo);
    public Integer countRoomByType(Integer id);
    public List<DayRoomNumberVo>  selectDayRoomType(Timestamp time,Integer typeid);
    //查询全空房
    public List<RoomSetPo> selectEmptyRoom(Integer typeid);

    //查询空房
    public List<RoomSetPo> selectEmptyRoomByOrder(Integer typeid);
    public Integer YZDay(String time,Integer roomId);
    /*未确认*/
    public Page<OrderDetailsVo> listUnconfirmed(String orderNumber,String passenger,
                                                Page<OrderDetailsVo> vo);
    /*已取消*/
    public Page<OrderDetailsVo> listCancelled(String orderNumber,String passenger,
                                              Page<OrderDetailsVo> vo);


    /////////////////改///////////////////////////////////////////////////////////////////
    //已确认
    public Page<OrderDetailsVo> allConfirm(String platform,String order,String reserName,String passName, Page<OrderDetailsVo> vo);
    //已入住
    public Page<OrderDetailsVo> checkinallorder(String platform,String order,String reserName,String passName, Page<OrderDetailsVo> vo);
    //已退房
    public Page<OrderDetailsVo> checkoutallorder(String platform,String order,String reserName,String passName, Page<OrderDetailsVo> vo);
    //已到款
    public Page<OrderDetailsVo> myaccountall(String platform,String order,String reserName,String passName, Page<OrderDetailsVo> vo);
    /*未确认*/
    public Page<OrderDetailsVo> listUnconfirmedall(String platform,String order,String reserName,String passName,
                                                Page<OrderDetailsVo> vo);
    /*已取消*/
    public Page<OrderDetailsVo> listCancelledall(String platform,String order,String reserName,String passName,
                                              Page<OrderDetailsVo> vo);

    public Integer updateRegister(Integer inpasssId,Integer id);

    public Page<OrderDetailsVo> selectFinanceTwo(String orderNumber, String roomName, Timestamp time,String reserName, String passName, Page<OrderDetailsVo> vo);

    public Integer selectWhole(String time,Integer roomId,Integer id);

    public Page<OrderDetailsVo> orderByplatform(Integer platformId,Page<OrderDetailsVo> vo);
}
