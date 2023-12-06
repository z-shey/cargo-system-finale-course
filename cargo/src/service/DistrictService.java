package service;

import entity.District;
import java.util.List;

public interface DistrictService {
    List<District> selectAllDistrict();
    District selectDistrict(Integer DistrictID);
}
