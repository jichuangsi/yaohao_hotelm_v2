package com.gx.service;

import com.gx.page.Page;
import com.gx.po.SupplierAndGuestPo;
import com.gx.po.guestRoomLevelPo;

import java.util.List;

public interface GuestRoomLevelService {

    public List<guestRoomLevelPo> list();
    public List<guestRoomLevelPo> listwhole(String hometype);
   public Page<guestRoomLevelPo> pagelistwhole(String hometype,Page<guestRoomLevelPo> vo);
    public Integer inser(guestRoomLevelPo po);

    public Integer updateType(guestRoomLevelPo po);

    public Integer nameYZ(guestRoomLevelPo po);
    public Integer YZ(String guestRoomLevel);

    public guestRoomLevelPo selectById(Integer id);
    //合约
    public Page<guestRoomLevelPo> pagelistother(String hometype,Integer supplierId,Page<guestRoomLevelPo> vo);

    public List<guestRoomLevelPo> listother(String hometype);

    public Integer insertsg(SupplierAndGuestPo po);
}
