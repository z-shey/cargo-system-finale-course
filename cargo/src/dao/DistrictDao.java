package dao;


import entity.CargoType;
import entity.District;

import java.util.List;

public interface DistrictDao {
    List<District> selectAllDistrict();

    District selectById(Integer DistrictID);
}
