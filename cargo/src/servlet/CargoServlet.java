package servlet;


import entity.Staff;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.impl.StaffServiceImpl;

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


            }
            case "cargo_edit_pre" -> {
                String cargoId = req.getParameter("cargo_id"); // 获取
            }
            case "cargo_edit" -> {

            }
            case "cargo_delete" -> {

            }
        }
    }
}
