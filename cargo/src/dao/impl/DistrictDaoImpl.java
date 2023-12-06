package dao.impl;

import dao.DistrictDao;
import entity.District;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import util.DBUtil;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class DistrictDaoImpl implements DistrictDao {
    private final QueryRunner queryRunner = new QueryRunner();

    @Override
    public List<District> selectAllDistrict() {
        String sql = "SELECT * FROM district";
        try (Connection connection = DBUtil.getConnection()) {
            return queryRunner.query(connection, sql, new BeanListHandler<>(District.class));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public District selectById(Integer DistrictID) {
        String sql = "SELECT * FROM district WHERE DistrictID=?";
        try (Connection connection = DBUtil.getConnection()) {
            return queryRunner.query(connection, sql, new BeanHandler<>(District.class), DistrictID);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
