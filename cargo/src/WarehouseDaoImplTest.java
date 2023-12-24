import dao.WarehouseDao;
import dao.impl.WarehouseDaoImpl;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

public class WarehouseDaoImplTest {
    private WarehouseDao warehouseDao;

    @Before
    public void setup() {
        // 初始化 WarehouseDao 的实例
        warehouseDao = new WarehouseDaoImpl();
    }

    @Test
    public void testCount() {
        // 插入一些测试数据
        // 统计仓库数量
        Long count = warehouseDao.countCargo(1);
        System.out.println(count);
    }
}
