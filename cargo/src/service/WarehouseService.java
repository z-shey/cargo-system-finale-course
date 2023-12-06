package service;

import entity.Warehouse;

import java.util.List;

public interface WarehouseService {
    List<Warehouse> selectAllWarehouse();

    Warehouse selectWarehouse(Integer WarehouseID);

    void updateWarehouse(Warehouse warehouse);

    void deleteWarehouse(Integer WarehouseID);

    void insertWarehouse(Warehouse warehouse);
}
