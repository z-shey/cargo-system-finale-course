package service;

import entity.Staff;

import java.util.List;

public interface StaffService {
    List<Staff> selectAllStaff();

    Staff selectStaff(Integer StaffID);

    void updateStaff(Staff staff);

    void deleteStaff(Integer StaffID);

    void insertStaff(Staff staff);

    Staff login(String Username, String Password);

    void register(Staff staff);
}
