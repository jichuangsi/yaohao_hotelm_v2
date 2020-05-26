package com.gx.service.impl;

import com.gx.dao.OrderDao;
import com.gx.page.Page;
import com.gx.po.OrderPo;
import com.gx.po.RoomSetPo;
import com.gx.service.OrderService;
import com.gx.vo.DayRoomNumberVo;
import com.gx.vo.IndayVo;
import com.gx.vo.OrderDetailsVo;
import com.gx.vo.OrderTimeVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.List;

@Transactional
@Service("OrderService")
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderDao orderDao;

    @Override
    public Integer inserAll(OrderPo orderPo) {
        return orderDao.inserAll(orderPo);
    }

    @Override
    public Page<OrderDetailsVo> list(String orderNumber, String passengerId, Page<OrderDetailsVo> vo) {
        int start=0;
        if (vo.getCurrentPage()>1) {
            start=(vo.getCurrentPage()-1)*vo.getPageSize();
        }
        List<OrderDetailsVo> list=orderDao.list(orderNumber,passengerId, start, vo.getPageSize());
        vo.setResult(list);
        int count=orderDao.countList(orderNumber,passengerId);
        vo.setTotal(count);
        vo.setTotalPage(vo.getTotal()%vo.getPageSize() != 0 ?vo.getTotal()/vo.getPageSize() + 1 : vo.getTotal()/vo.getPageSize());
        return vo;
    }

    @Override
    public Page<OrderDetailsVo> checkinorder(String orderNumber, String passengerId, Page<OrderDetailsVo> vo) {
        int start=0;
        if (vo.getCurrentPage()>1) {
            start=(vo.getCurrentPage()-1)*vo.getPageSize();
        }
        List<OrderDetailsVo> list=orderDao.checkinorder(orderNumber,passengerId, start, vo.getPageSize());
        vo.setResult(list);
        int count=orderDao.countcheckinorder(orderNumber,passengerId);
        vo.setTotal(count);
        vo.setTotalPage(vo.getTotal()%vo.getPageSize() != 0 ?vo.getTotal()/vo.getPageSize() + 1 : vo.getTotal()/vo.getPageSize());
        return vo;
    }

    @Override
    public Page<OrderDetailsVo> checkoutorder(String orderNumber, String passengerId, Page<OrderDetailsVo> vo) {
        int start=0;
        if (vo.getCurrentPage()>1) {
            start=(vo.getCurrentPage()-1)*vo.getPageSize();
        }
        List<OrderDetailsVo> list=orderDao.checkoutorder(orderNumber,passengerId, start, vo.getPageSize());
        vo.setResult(list);
        int count=orderDao.countcheckoutorder(orderNumber,passengerId);
        vo.setTotal(count);
        vo.setTotalPage(vo.getTotal()%vo.getPageSize() != 0 ?vo.getTotal()/vo.getPageSize() + 1 : vo.getTotal()/vo.getPageSize());
        return vo;
    }

    @Override
    public Page<OrderDetailsVo> myaccount(String orderNumber, String passengerId, Page<OrderDetailsVo> vo) {
        int start=0;
        if (vo.getCurrentPage()>1) {
            start=(vo.getCurrentPage()-1)*vo.getPageSize();
        }
        List<OrderDetailsVo> list=orderDao.myaccount(orderNumber,passengerId, start, vo.getPageSize());
        vo.setResult(list);
        int count=orderDao.countmyaccount(orderNumber,passengerId);
        vo.setTotal(count);
        vo.setTotalPage(vo.getTotal()%vo.getPageSize() != 0 ?vo.getTotal()/vo.getPageSize() + 1 : vo.getTotal()/vo.getPageSize());
        return vo;
    }

   /* @Override
    public Integer updateStatus(String orderNumber, Integer status) {
        return orderDao.updateStatus(orderNumber, status);
    }*/

    @Override
    public OrderPo selectByOrderNumber(String orderNumber) {
        return orderDao.selectByOrderNumber(orderNumber);
    }

    @Override
    public Page<OrderDetailsVo> selectCheckinList(String orderNumber, Integer passengerId, long time, Page<OrderDetailsVo> vo) {
        int start=0;
        if (vo.getCurrentPage()>1) {
            start=(vo.getCurrentPage()-1)*vo.getPageSize();
        }
        List<OrderDetailsVo> list=orderDao.selectCheckinList(orderNumber,passengerId,time, start, vo.getPageSize());
        vo.setResult(list);
        int count=orderDao.countSelectCheckinList(orderNumber,passengerId,time);
        vo.setTotal(count);
        return vo;
    }

    @Override
    public Page<OrderDetailsVo> selectOrderDetail(String orderNumber, Page<OrderDetailsVo> vo) {
        int start=0;
        if (vo.getCurrentPage()>1) {
            start=(vo.getCurrentPage()-1)*vo.getPageSize();
        }
        List<OrderDetailsVo> list=orderDao.selectOrderDetail(orderNumber,start, vo.getPageSize());
        vo.setResult(list);
        int count=orderDao.countSelectOrderDetail(orderNumber);
        vo.setTotal(count);
        return vo;
    }

    @Override
    public Page<OrderDetailsVo> financial(long startTime, long endTime, Page<OrderDetailsVo> vo) {
        int start=0;
        if (vo.getCurrentPage()>1) {
            start=(vo.getCurrentPage()-1)*vo.getPageSize();
        }
        List<OrderDetailsVo> list=orderDao.financial(startTime,endTime,start, vo.getPageSize());
        vo.setResult(list);
        int count=orderDao.countFinancial(startTime,endTime);
        vo.setTotal(count);
        return vo;
    }

    @Override
    public Page<OrderTimeVo> selectRoomByTime(Timestamp time, Page<OrderTimeVo> vo) {
        int start=0;
        if (vo.getCurrentPage()>1) {
            start=(vo.getCurrentPage()-1)*vo.getPageSize();
        }
        List<OrderTimeVo> list=orderDao.selectRoomByTime(time,start, vo.getPageSize());
        vo.setResult(list);
        int count=orderDao.countSelectRoomByTime(time);
        vo.setTotal(count);
        return vo;
    }



    @Override
    public Integer codeNumberYZ(String orderNumber) {
        return orderDao.codeNumberYZ(orderNumber);
    }

    @Override
    public List<IndayVo> checkinDay(String time, Integer roomId) {
        return orderDao.checkinDay(time, roomId);
    }


    @Override
    public Page<OrderTimeVo> selectRoomPage(Page<OrderTimeVo> vo) {
        int start=0;
        if (vo.getCurrentPage()>1) {
            start=(vo.getCurrentPage()-1)*vo.getPageSize();
        }
        List<OrderTimeVo> list=orderDao.selectRoomPage(start, vo.getPageSize());
        vo.setResult(list);
        int count=orderDao.countSelectRoom();
        vo.setTotal(count);
        return vo;
    }
   @Override
   public List<OrderTimeVo> selectRoom() {
       List<OrderTimeVo> list=orderDao.selectRoom();
       return list;
   }
    @Override
    public List<OrderTimeVo> selectRoomByTimes(Timestamp time,List<Integer> list) {
        return orderDao.selectRoomByTimes(time,list);
    }

    @Override
    public List<OrderTimeVo> selectRoomByin(List<Integer> idList,List<Integer> list) {
        return orderDao.selectRoomByin(idList,list);
    }

    @Override
    public List<DayRoomNumberVo> selectDayRoom(String time, Integer roomId) {
        return orderDao.selectDayRoom(time, roomId);
    }

    @Override
    public List<OrderTimeVo> selectRooms() {
        return orderDao.selectRooms();
    }

    @Override
    public List<OrderTimeVo> selectRoomByins(List<Integer> allList) {
        return orderDao.selectRoomByins(allList);
    }

    @Override
    public Integer updateInEnd(String start, String end, Integer id) {
        return orderDao.updateInEnd(start, end, id);
    }


    /////////////////////////////////////////////////////////////////////////////////////////////

    @Override
    public Page<OrderDetailsVo> allContractOrder(String name, String orderNumber,Page<OrderDetailsVo> vo) {
        int start=0;
        if (vo.getCurrentPage()>1) {
            start=(vo.getCurrentPage()-1)*vo.getPageSize();
        }
        List<OrderDetailsVo> list=orderDao.allContractOrder(name,orderNumber,start, vo.getPageSize());
        vo.setResult(list);
        int count=orderDao.countallContractOrder(name,orderNumber);
        vo.setTotal(count);
        return vo;
    }

    @Override
    public Integer updateMoney(Integer id, Timestamp time) {
        return orderDao.updateMoney(id, time);
    }


    @Override
    public List<OrderDetailsVo> fianceorder(Integer roomId,String time) {
        return orderDao.fianceorder(roomId,time);
    }

    @Override
    public List<OrderDetailsVo> fianceordertime(Integer roomId, String time) {
        return orderDao.fianceordertime(roomId, time);
    }

    @Override
    public Integer roomAcountu(Integer roomId) {
        return orderDao.roomAcountu(roomId);
    }


    @Override
    public Integer updateStatus(Integer id, Integer status) {
        return orderDao.updateStatus(id,status);
    }

    @Override
    public OrderDetailsVo selectById(Integer id) {
        return orderDao.selectById(id);
    }

    @Override
    public List<IndayVo> updateCheckDay(String time, Integer roomId, Integer id) {
        return orderDao.updateCheckDay(time, roomId, id);
    }

    @Override
    public Integer updateAll(OrderPo po) {
        return orderDao.updateAll(po);
    }

    //===============================整和================================================================================

    @Override
    public Page<OrderDetailsVo> selectRoomByType(Integer id,String roomNumber, Page<OrderDetailsVo> vo) {
        int start=0;
        if (vo.getCurrentPage()>1) {
            start=(vo.getCurrentPage()-1)*vo.getPageSize();
        }
        List<OrderDetailsVo> list=orderDao.selectRoomByType(id,roomNumber,start, vo.getPageSize());
        vo.setResult(list);
        Integer count=orderDao.countRoomByTypes(id,roomNumber);
        if (count==null){
            count=0;
        }
        vo.setTotal(count);
        return vo;
    }


    @Override
    public List<DayRoomNumberVo> selectDayRoomType(Timestamp time, Integer typeid) {
        return orderDao.selectDayRoomType(time, typeid);
    }

    @Override
    public Integer countRoomByType(Integer id) {
        return orderDao.countRoomByType(id);
    }

    @Override
    public List<RoomSetPo> selectEmptyRoom(Integer typeid) {
        return orderDao.selectEmptyRoom(typeid);
    }

    @Override
    public List<RoomSetPo> selectEmptyRoomByOrder(Integer typeid) {
        return orderDao.selectEmptyRoomByOrder(typeid);
    }

    @Override
    public Integer YZDay(String time, Integer roomId) {
        return orderDao.YZDay(time, roomId);
    }

    @Override
    public Page<OrderDetailsVo> listUnconfirmed(String orderNumber, String passenger,Page<OrderDetailsVo> vo) {
        int start=0;
        if (vo.getCurrentPage()>1) {
            start=(vo.getCurrentPage()-1)*vo.getPageSize();
        }
        List<OrderDetailsVo> list=orderDao.listUnconfirmed(orderNumber,passenger, start, vo.getPageSize());
        vo.setResult(list);
        int count=orderDao.countListUnconfirmed(orderNumber,passenger);
        vo.setTotal(count);
        vo.setTotalPage(vo.getTotal()%vo.getPageSize() != 0 ?vo.getTotal()/vo.getPageSize() + 1 : vo.getTotal()/vo.getPageSize());
        return vo;
    }

    @Override
    public Page<OrderDetailsVo> listCancelled(String orderNumber, String passenger,Page<OrderDetailsVo> vo) {
        int start=0;
        if (vo.getCurrentPage()>1) {
            start=(vo.getCurrentPage()-1)*vo.getPageSize();
        }
        List<OrderDetailsVo> list=orderDao.listCancelled(orderNumber,passenger, start, vo.getPageSize());
        vo.setResult(list);
        int count=orderDao.countListCancelled(orderNumber,passenger);
        vo.setTotal(count);
        vo.setTotalPage(vo.getTotal()%vo.getPageSize() != 0 ?vo.getTotal()/vo.getPageSize() + 1 : vo.getTotal()/vo.getPageSize());
        return vo;
    }

    //////////////////////////改////////////////////////////////////////////////////////////////

    @Override
    public Page<OrderDetailsVo> allConfirm(String platform, String order, String reserName, String passName, Page<OrderDetailsVo> vo) {
        int start=0;
        if (vo.getCurrentPage()>1) {
            start=(vo.getCurrentPage()-1)*vo.getPageSize();
        }
        List<OrderDetailsVo> list=orderDao.allConfirm(platform,order,reserName,passName, start, vo.getPageSize());
        vo.setResult(list);
        int count=orderDao.countAllConfirm(platform,order,reserName,passName);
        vo.setTotal(count);
        vo.setTotalPage(vo.getTotal()%vo.getPageSize() != 0 ?vo.getTotal()/vo.getPageSize() + 1 : vo.getTotal()/vo.getPageSize());
        return vo;
    }

    @Override
    public Page<OrderDetailsVo> checkinallorder(String platform, String order, String reserName, String passName, Page<OrderDetailsVo> vo) {
        int start=0;
        if (vo.getCurrentPage()>1) {
            start=(vo.getCurrentPage()-1)*vo.getPageSize();
        }
        List<OrderDetailsVo> list=orderDao.checkinallorder(platform,order,reserName,passName, start, vo.getPageSize());
        vo.setResult(list);
        int count=orderDao.countcheckinallorder(platform,order,reserName,passName);
        vo.setTotal(count);
        vo.setTotalPage(vo.getTotal()%vo.getPageSize() != 0 ?vo.getTotal()/vo.getPageSize() + 1 : vo.getTotal()/vo.getPageSize());
        return vo;
    }

    @Override
    public Page<OrderDetailsVo> checkoutallorder(String platform, String order, String reserName, String passName, Page<OrderDetailsVo> vo) {
        int start=0;
        if (vo.getCurrentPage()>1) {
            start=(vo.getCurrentPage()-1)*vo.getPageSize();
        }
        List<OrderDetailsVo> list=orderDao.checkoutallorder(platform,order,reserName,passName, start, vo.getPageSize());
        vo.setResult(list);
        int count=orderDao.countcheckoutallorder(platform,order,reserName,passName);
        vo.setTotal(count);
        vo.setTotalPage(vo.getTotal()%vo.getPageSize() != 0 ?vo.getTotal()/vo.getPageSize() + 1 : vo.getTotal()/vo.getPageSize());
        return vo;
    }

    @Override
    public Page<OrderDetailsVo> myaccountall(String platform, String order, String reserName, String passName, Page<OrderDetailsVo> vo) {
        int start=0;
        if (vo.getCurrentPage()>1) {
            start=(vo.getCurrentPage()-1)*vo.getPageSize();
        }
        List<OrderDetailsVo> list=orderDao.myaccountall(platform,order,reserName,passName, start, vo.getPageSize());
        vo.setResult(list);
        int count=orderDao.countmyaccountall(platform,order,reserName,passName);
        vo.setTotal(count);
        vo.setTotalPage(vo.getTotal()%vo.getPageSize() != 0 ?vo.getTotal()/vo.getPageSize() + 1 : vo.getTotal()/vo.getPageSize());
        return vo;
    }

    @Override
    public Page<OrderDetailsVo> listUnconfirmedall(String platform, String order, String reserName, String passName, Page<OrderDetailsVo> vo) {
        int start=0;
        if (vo.getCurrentPage()>1) {
            start=(vo.getCurrentPage()-1)*vo.getPageSize();
        }
        List<OrderDetailsVo> list=orderDao.listUnconfirmedall(platform,order,reserName,passName, start, vo.getPageSize());
        vo.setResult(list);
        int count=orderDao.countListUnconfirmedall(platform,order,reserName,passName);
        vo.setTotal(count);
        vo.setTotalPage(vo.getTotal()%vo.getPageSize() != 0 ?vo.getTotal()/vo.getPageSize() + 1 : vo.getTotal()/vo.getPageSize());
        return vo;
    }

    @Override
    public Page<OrderDetailsVo> listCancelledall(String platform, String order, String reserName, String passName, Page<OrderDetailsVo> vo) {
        int start=0;
        if (vo.getCurrentPage()>1) {
            start=(vo.getCurrentPage()-1)*vo.getPageSize();
        }
        List<OrderDetailsVo> list=orderDao.listCancelledall(platform,order,reserName,passName, start, vo.getPageSize());
        vo.setResult(list);
        int count=orderDao.countListCancelledall(platform,order,reserName,passName);
        vo.setTotal(count);
        vo.setTotalPage(vo.getTotal()%vo.getPageSize() != 0 ?vo.getTotal()/vo.getPageSize() + 1 : vo.getTotal()/vo.getPageSize());
        return vo;
    }

    @Override
    public Integer updateRegister(Integer inpasssId, Integer id) {
        return orderDao.updateRegister(inpasssId, id);
    }

    @Override
    public Page<OrderDetailsVo> selectFinanceTwo(String orderNumber, String roomName, Timestamp time,String reserName, String passName,  Page<OrderDetailsVo> vo) {
        int start=0;
        if (vo.getCurrentPage()>1) {
            start=(vo.getCurrentPage()-1)*vo.getPageSize();
        }
        List<OrderDetailsVo> list=orderDao.selectFinanceTwo(orderNumber,roomName, time,reserName,passName,start, vo.getPageSize());
        vo.setResult(list);
        int count=orderDao.countFinanceTwo(orderNumber,roomName, time,reserName,passName);
        vo.setTotal(count);
        vo.setTotalPage(vo.getTotal()%vo.getPageSize() != 0 ?vo.getTotal()/vo.getPageSize() + 1 : vo.getTotal()/vo.getPageSize());
        return vo;

    }

    @Override
    public Integer selectWhole(String time, Integer roomId,Integer id) {
        return orderDao.selectWhole(time, roomId,id);
    }

    @Override
    public Page<OrderDetailsVo> orderByplatform(Integer platformId, Page<OrderDetailsVo> vo) {
        int start=0;
        if (vo.getCurrentPage()>1) {
            start=(vo.getCurrentPage()-1)*vo.getPageSize();
        }
        List<OrderDetailsVo> list=orderDao.orderByplatform(platformId,start, vo.getPageSize());
        vo.setResult(list);
        int count=orderDao.countOrderByplatform(platformId);
        vo.setTotal(count);
        vo.setTotalPage(vo.getTotal()%vo.getPageSize() != 0 ?vo.getTotal()/vo.getPageSize() + 1 : vo.getTotal()/vo.getPageSize());
        return vo;
    }
}
