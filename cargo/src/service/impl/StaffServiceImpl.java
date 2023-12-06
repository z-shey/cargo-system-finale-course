package service.impl;

import dao.StaffDao;
import dao.impl.StaffDaoImpl;
import entity.Staff;
import service.StaffService;

import java.util.List;

public class StaffServiceImpl implements StaffService {
    StaffDao staffDao = new StaffDaoImpl();

    @Override
    public List<Staff> selectAllStaff() {
        return staffDao.selectAllStaff();
    }

    @Override
    public Staff selectStaff(Integer StaffID) {
        return staffDao.selectById(StaffID);
    }

    @Override
    public void updateStaff(Staff staff) {
        staffDao.update(staff);
    }

    @Override
    public void deleteStaff(Integer StaffID) {
        staffDao.delete(StaffID);
    }

    @Override
    public void insertStaff(Staff staff) {
        staffDao.insert(staff);
    }

    @Override
    public Staff login(String Username, String Password) {
        return staffDao.selectByUsernameAndPassword(Username, Password);
    }

    @Override
    public void register(Staff staff) {
        insertStaff(staff);
    }
}
