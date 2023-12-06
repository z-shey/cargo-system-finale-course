package service;

import entity.Cargo;

import java.util.List;

public interface CargoService {
    List<Cargo> selectAllCargo();

    Cargo selectCargo(Integer CargoID);

    void updateCargo(Cargo cargo);

    void deleteCargo(Integer CargoID);

    void insertCargo(Cargo cargo);
}
