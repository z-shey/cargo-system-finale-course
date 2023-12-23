package servlet;


import entity.Cargo;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.impl.CargoServiceImpl;

import java.io.IOException;

@WebServlet(name = "CargoServlet", value = "/cargo")
public class CargoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");

        String flag = req.getParameter("flag"); // 前端获取操作类型

        switch (flag) {
            case "cargo_add" -> {
                Cargo cargo = new Cargo();
                cargo.setCargoName(req.getParameter("cargo_name"));
                cargo.setCargoPrice(Double.valueOf(req.getParameter("cargo_price")));
                cargo.setCargoTypeID(Integer.valueOf(req.getParameter("cargo_type")));
                cargo.setWarehouseID(Integer.valueOf(req.getParameter("cargo_warehouseID")));
                cargo.setCargoRemark(req.getParameter("cargo_description"));

                new CargoServiceImpl().insert(cargo);

                resp.sendRedirect("workspace.jsp");
            }
            case "cargo_edit_pre" -> {
                String cargoId = req.getParameter("cargo_id"); // 获取
                Cargo cargo = new CargoServiceImpl().selectById(Integer.valueOf(cargoId));

                req.setAttribute("old_cargo", cargo);
                req.getRequestDispatcher("cargo_edit.jsp").forward(req, resp);
            }
            case "cargo_edit" -> {
                Cargo cargo = new Cargo();

                cargo.setCargoID(Integer.valueOf(req.getParameter("cargo_id")));
                cargo.setCargoName(req.getParameter("cargo_name"));
                cargo.setCargoPrice(Double.valueOf(req.getParameter("cargo_price")));
                cargo.setCargoTypeID(Integer.valueOf(req.getParameter("cargo_type")));
                cargo.setWarehouseID(Integer.valueOf(req.getParameter("cargo_warehouseID")));
                cargo.setCargoRemark(req.getParameter("cargo_description"));

                new CargoServiceImpl().update(cargo);

                resp.sendRedirect("workspace.jsp");
            }
            case "cargo_delete" -> {
                new CargoServiceImpl().delete(Integer.valueOf(req.getParameter("delete_cargo_id")));
                resp.sendRedirect("workspace.jsp");
            }
        }
    }
}
