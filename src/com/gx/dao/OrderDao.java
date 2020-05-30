package com.gx.dao;

import com.gx.page.Page;
import com.gx.po.OrderPo;
import com.gx.po.RoomSetPo;
import com.gx.vo.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.List;

public interface OrderDao {

    @Transactional
    public Integer inserAll(OrderPo orderPo);

    //条件查询
    public List<OrderDetailsVo> list(@Param("orderNumber") String orderNumber, @Param("passenger") String passenger,
                                     @Param("start") int start, @Param("size") int size);


    public Integer countList(@Param("orderNumber") String orderNumber, @Param("passenger") String passenger);

    //已入住
    public List<OrderDetailsVo> checkinorder(@Param("orderNumber") String orderNumber, @Param("passenger") String passenger,
                                             @Param("start") int start, @Param("size") int size);

    public Integer countcheckinorder(@Param("orderNumber") String orderNumber, @Param("passenger") String passenger);

    //已退房
    public List<OrderDetailsVo> checkoutorder(@Param("orderNumber") String orderNumber, @Param("passenger") String passenger,
                                              @Param("start") int start, @Param("size") int size);

    public Integer countcheckoutorder(@Param("orderNumber") String orderNumber, @Param("passenger") String passenger);

    //已到款
    public List<OrderDetailsVo> myaccount(@Param("orderNumber") String orderNumber, @Param("passenger") String passenger,
                                          @Param("start") int start, @Param("size") int size);

    public Integer countmyaccount(@Param("orderNumber") String orderNumber, @Param("passenger") String passenger);


    /* //修改订单状态
     @Transactional
     public Integer updateStatus(@Param("orderNumber")String orderNumber, @Param("status")Integer status);*/
    //根据订单号查询订单
    public OrderPo selectByOrderNumber(@Param("orderNumber") String orderNumber);

    //查询已确认订单
    public List<OrderDetailsVo> selectCheckinList(@Param("orderNumber") String orderNumber,
                                                  @Param("passengerId") Integer passengerId,
                                                  @Param("time") long time, @Param("start") int start, @Param("size") int size);

    //查询已确认订单
    public int countSelectCheckinList(@Param("orderNumber") String orderNumber,
                                      @Param("passengerId") Integer passengerId,
                                      @Param("time") long time);

    //查询订单明细
    public List<OrderDetailsVo> selectOrderDetail(@Param("orderNumber") String orderNumber,
                                                  @Param("start") int start, @Param("size") int size);

    //查询订单明细
    public int countSelectOrderDetail(@Param("orderNumber") String orderNumber);

    public List<OrderDetailsVo> financial(@Param("startTime") long startTime, @Param("endTime") long endTime,
                                          @Param("start") int start, @Param("size") int size);

    public int countFinancial(@Param("startTime") long startTime, @Param("endTime") long endTime);

    //验证订单号是否存在
    public Integer codeNumberYZ(String orderNumber);

    public List<OrderTimeVo> selectRoomByTime(@Param("time") Timestamp time,
                                              @Param("start") int start, @Param("size") int size);

    public int countSelectRoomByTime(@Param("time") Timestamp time);


    public List<OrderTimeVo> selectRoomPage(@Param("start") int start, @Param("size") int size);

    public List<OrderTimeVo> selectRoom();

    public Integer countSelectRoom();

    public List<OrderTimeVo> selectRoomByTimes(@Param("time") Timestamp time, @Param("list") List<Integer> list);

    public List<OrderTimeVo> selectRoomByin(@Param("idList") List<Integer> idList, @Param("allList") List<Integer> allList);


    public List<IndayVo> checkinDay(@Param("time") String time,
                                    @Param("roomId") Integer roomId);

    public List<DayRoomNumberVo> selectDayRoom(@Param("time") String time,
                                               @Param("roomId") Integer roomId);

    public List<OrderTimeVo> selectRooms();

    public List<OrderTimeVo> selectRoomByins(@Param("allList") List<Integer> allList);

    public Integer updateInEnd(@Param("start") String start, @Param("end") String end,
                               @Param("id") Integer id);

    /////////////////////////////////////////////////////////////////////////////////////
    public List<OrderDetailsVo> allContractOrder(@Param("name") String name, @Param("orderNumber") String orderNumber,
                                                 @Param("start") int start, @Param("size") int size);

    public int countallContractOrder(@Param("name") String name, @Param("orderNumber") String orderNumber);

    @Transactional
    public Integer updateMoney(@Param("id") Integer id, @Param("time") Timestamp time);


    public List<OrderDetailsVo> fianceorder(@Param("roomId") Integer roomId, @Param("time") String time);

    public List<OrderDetailsVo> fianceordertime(@Param("roomId") Integer roomId, @Param("time") String time);

    public Integer roomAcountu(@Param("roomId") Integer roomId);

    @Transactional
    public Integer updateStatus(@Param("id") Integer id, @Param("status") Integer status);

    public OrderDetailsVo selectById(Integer id);


    public List<IndayVo> updateCheckDay(@Param("time") String time,
                                        @Param("roomId") Integer roomId, @Param("id") Integer id);

    public Integer updateAll(OrderPo po);
    //========================================整租======================================================================

    public List<OrderDetailsVo> selectRoomByType(@Param("id") Integer id, @Param("roomNumber") String roomNumber, @Param("start") int start, @Param("size") int size);

    public Integer countRoomByType(@Param("id") Integer id);

    public Integer countRoomByTypes(@Param("id") Integer id, @Param("roomNumber") String roomNumber);

    public List<DayRoomNumberVo> selectDayRoomType(@Param("time") Timestamp time, @Param("typeid") Integer typeid);

    //查询全空房
    public List<RoomSetPo> selectEmptyRoom(@Param("typeid") Integer typeid);

    //查询空房
    public List<RoomSetPo> selectEmptyRoomByOrder(@Param("typeid") Integer typeid);

    public Integer YZDay(@Param("time") String time, @Param("roomId") Integer roomId);

    /*未确认*/
    public List<OrderDetailsVo> listUnconfirmed(@Param("orderNumber") String orderNumber, @Param("passenger") String passenger,
                                                @Param("start") int start, @Param("size") int size);

    public Integer countListUnconfirmed(@Param("orderNumber") String orderNumber, @Param("passenger") String passenger);

    /*已取消*/
    public List<OrderDetailsVo> listCancelled(@Param("orderNumber") String orderNumber, @Param("passenger") String passenger,
                                              @Param("start") int start, @Param("size") int size);

    public Integer countListCancelled(@Param("orderNumber") String orderNumber, @Param("passenger") String passenger);


    ///////////////////////////改=====================//////////////////////////////////////////////////////
    //条件查询String platform,String order,String reserName,String passName
    public List<OrderDetailsVo> allConfirm(@Param("platform") Integer platform, @Param("order") String order,
                                           @Param("reserName") String reserName, @Param("passName") String passName,
                                           @Param("start") int start, @Param("size") int size);


    public Integer countAllConfirm(@Param("platform") Integer platform, @Param("order") String order,
                                   @Param("reserName") String reserName, @Param("passName") String passName);

    //已入住
    public List<OrderDetailsVo> checkinallorder(@Param("platform") Integer platform, @Param("order") String order,
                                                @Param("reserName") String reserName, @Param("passName") String passName,
                                                @Param("start") int start, @Param("size") int size);

    public Integer countcheckinallorder(@Param("platform") Integer platform, @Param("order") String order,
                                        @Param("reserName") String reserName, @Param("passName") String passName);

    //已退房
    public List<OrderDetailsVo> checkoutallorder(@Param("platform") Integer platform, @Param("order") String order,
                                                 @Param("reserName") String reserName, @Param("passName") String passName,
                                                 @Param("start") int start, @Param("size") int size);

    public Integer countcheckoutallorder(@Param("platform") Integer platform, @Param("order") String order,
                                         @Param("reserName") String reserName, @Param("passName") String passName);

    //已到款
    public List<OrderDetailsVo> myaccountall(@Param("platform") Integer platform, @Param("order") String order,
                                             @Param("reserName") String reserName, @Param("passName") String passName,
                                             @Param("start") int start, @Param("size") int size);

    public Integer countmyaccountall(@Param("platform") Integer platform, @Param("order") String order,
                                     @Param("reserName") String reserName, @Param("passName") String passName);

    /*未确认*/
    public List<OrderDetailsVo> listUnconfirmedall(@Param("platform") Integer platform, @Param("order") String order,
                                                   @Param("reserName") String reserName, @Param("passName") String passName,
                                                   @Param("start") int start, @Param("size") int size);

    public Integer countListUnconfirmedall(@Param("platform") Integer platform, @Param("order") String order,
                                           @Param("reserName") String reserName, @Param("passName") String passName);

    /*已取消*/
    public List<OrderDetailsVo> listCancelledall(@Param("platform") Integer platform, @Param("order") String order,
                                                 @Param("reserName") String reserName, @Param("passName") String passName,
                                                 @Param("start") int start, @Param("size") int size);

    public Integer countListCancelledall(@Param("platform") Integer platform, @Param("order") String order,
                                         @Param("reserName") String reserName, @Param("passName") String passName);

    public Integer updateRegister(@Param("inpasssId") Integer inpasssId, @Param("id") Integer id);

    public List<OrderDetailsVo> selectFinanceTwo(@Param("platform")Integer platform,@Param("orderNumber") String orderNumber, @Param("roomName") String roomName,
                                                 @Param("time") Timestamp time, @Param("reserName") String reserName, @Param("passName") String passName,
                                                 @Param("start") int start, @Param("size") int size);

    public Integer countFinanceTwo(@Param("platform")Integer platform,@Param("orderNumber") String orderNumber, @Param("roomName") String roomName,
                                   @Param("time") Timestamp time, @Param("reserName") String reserName, @Param("passName") String passName);

    public Integer selectWhole( @Param("time") String time,@Param("roomId") Integer roomId,@Param("id") Integer id);

    public List<OrderDetailsVo> orderByplatform(@Param("platformId") Integer platformId,@Param("start") int start, @Param("size") int size);
    public Integer countOrderByplatform(@Param("platformId") Integer platformId);


    public Integer WholeEmtyRoom(@Param("time") String time,@Param("roomId") Integer roomId);
    public OrderTimeVo WholeEmtyRoomDeatil(@Param("roomId") Integer roomId);

    public Integer updateDeposit(@Param("depositSattus") double depositSattus,@Param("roomId") Integer roomId);
}
