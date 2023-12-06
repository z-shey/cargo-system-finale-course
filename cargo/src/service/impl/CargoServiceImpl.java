package service.impl;

import dao.CargoDao;
import dao.impl.CargoDaoImpl;
import entity.Cargo;
import entity.Warehouse;
import service.CargoService;

import java.util.List;

public class CargoServiceImpl implements CargoService {
    CargoDao cargoDao = new CargoDaoImpl();

    @Override
    public List<Cargo> selectAllCargo() {
        return cargoDao.selectAllCargo();
    }

    @Override
    public Cargo selectCargo(Integer CargoID) {
        return cargoDao.selectById(CargoID);
    }

    @Override
    public void updateCargo(Cargo cargo) {
        cargoDao.update(cargo);
    }

    @Override
    public void deleteCargo(Integer CargoID) {
        cargoDao.delete(CargoID);
    }

    @Override
    public void insertCargo(Cargo cargo) {
        cargoDao.insert(cargo);
    }
}
