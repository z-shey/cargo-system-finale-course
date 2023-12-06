package service;

import entity.Role;

import java.util.List;

public interface RoleService {
    List<Role> selectAllRole();
    Role selectRole(Integer RoleID);
}
