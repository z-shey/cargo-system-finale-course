package service.impl;


import dao.DistrictDao;
import dao.impl.DistrictDaoImpl;
import entity.District;
import service.DistrictService;

import java.util.List;

public class DistrictServiceImpl implements DistrictService {
    DistrictDao districtDao = new DistrictDaoImpl();

    @Override
    public List<District> selectAllDistrict() {
        return districtDao.selectAllDistrict();
    }

    @Override
    public District selectDistrict(Integer DistrictID) {
        return districtDao.selectById(DistrictID);
    }
}
