package com.gx.dao;

import com.gx.page.Page;
import com.gx.po.SupplierAndGuestPo;
import com.gx.po.guestRoomLevelPo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GuestRoomLevelDao {

    public List<guestRoomLevelPo> list();

    public List<guestRoomLevelPo> listwhole(@Param("hometype")String hometype);
    public Integer insertAll(guestRoomLevelPo po);

    public Integer updateType(guestRoomLevelPo po);

    public Integer nameYZ(guestRoomLevelPo po);
    public Integer YZ(String guestRoomLevel);

    public guestRoomLevelPo selectById(Integer id);

    public List<guestRoomLevelPo> pagelistwhole(@Param("hometype")String hometype, @Param("start")int start, @Param("size")int size );

    public Integer countlistwhole(@Param("hometype")String hometype);

    //合约
    public List<guestRoomLevelPo> pagelistother(@Param("hometype")String hometype,@Param("supplierId")Integer supplierId, @Param("start")int start, @Param("size")int size );

    public Integer countlistother(@Param("hometype")String hometype,@Param("supplierId")Integer supplierId);
    public List<guestRoomLevelPo> listother(String hometype);

    public Integer insertsg(SupplierAndGuestPo po);
}
