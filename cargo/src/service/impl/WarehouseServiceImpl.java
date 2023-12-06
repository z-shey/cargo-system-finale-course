package service.impl;


import dao.WarehouseDao;
import dao.impl.WarehouseDaoImpl;
import entity.Warehouse;
import service.WarehouseService;

import java.util.List;

public class WarehouseServiceImpl implements WarehouseService {
    WarehouseDao warehouseDao = new WarehouseDaoImpl();

    @Override
    public List<Warehouse> selectAllWarehouse() {
        return warehouseDao.selectAllWarehouse();
    }

    @Override
    public Warehouse selectWarehouse(Integer WarehouseID) {
        return warehouseDao.selectWarehouseById(WarehouseID);
    }

    @Override
    public void updateWarehouse(Warehouse warehouse) {
        warehouseDao.update(warehouse);
    }

    @Override
    public void deleteWarehouse(Integer WarehouseID) {
        warehouseDao.delete(WarehouseID);
    }

    @Override
    public void insertWarehouse(Warehouse warehouse) {
        warehouseDao.insert(warehouse);
    }
}
