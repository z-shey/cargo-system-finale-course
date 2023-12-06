<%@ page import="java.util.List" %>
<%@ page import="entity.Staff" %>
<%@ page import="entity.Role" %>
<%@ page import="entity.Cargo" %>
<%@ page import="service.impl.*" %>
<%@ page import="entity.CargoType" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <link rel="stylesheet" href="assets/css/style.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://kit.fontawesome.com/3b6cde5636.js"></script>
    <script src="assets/js/style.js"></script>
</head>
<body>

<%
    // 获取登录信息
    HttpSession loginUserSession = request.getSession();
    Staff loginStaff = (Staff) loginUserSession.getAttribute("loginStaff");
    int role_id = loginStaff.getRoleID();

    if (loginStaff == null) {
        response.sendRedirect("login.jsp");
    } else {
        role_id = loginStaff.getRoleID();
    }
%>


<div class="wrapper">
    <div class="sidebar">
        <div class="bg_shadow">
        </div>
        <div class="sidebar_inner">
            <div class="close">
                <i class="fa-solid fa-xmark"></i>
            </div>
            <div class="profile_info">
                <div class="profile_img">
                    <img src="http://q.qlogo.cn/headimg_dl?dst_uin=3317229064&spec=640&img_type=jpg" alt="">
                </div>
                <div class="profile_data">
                    <p class="name"><%=loginStaff.getStaffName()%>
                    </p>
                    <span class="span-info"><%=loginStaff.getUsername()%></span>
                    <span class="span-info"><i
                            class="fa-solid fa-user"></i><%=new RoleServiceImpl().selectRole(loginStaff.getRoleID()).getRoleName()%></span>
                </div>
            </div>

            <ul class="sidebar_menu">
                <li class="active">
                    <a onclick="changeContent('workArea')">
                        <div class="icon"><i class="fa-solid fa-table-columns"></i></div>
                        <div class="title">工作区</div>
                    </a>
                </li>

                <% if (role_id == 1) {%>
                <li>
                    <a onclick="changeContent('userManagement')">
                        <div class="icon"><i class="fa-solid fa-users"></i></div>
                        <div class="title">用户管理</div>
                    </a>
                </li>
                <%}%>

                <% if (role_id == 1 || role_id == 2 || role_id == 3 || role_id == 4) {%>
                <li>
                    <a onclick="changeContent('cargoManagement')">
                        <div class="icon"><i class="fa-solid fa-box-open"></i></div>
                        <div class="title">货物管理</div>
                    </a>
                </li>
                <%}%>
                <% if (role_id == 1 || role_id == 2) {%>
                <li>
                    <a onclick="changeContent('warehouseManagement')">
                        <div class="icon"><i class="fa-solid fa-house-flag"></i></div>
                        <div class="title">仓库管理</div>
                    </a>
                </li>
                <%}%>

                <% if (role_id == 1) {%>
                <li>
                    <a onclick="changeContent('districtManagement')">
                        <div class="icon"><i class="fa-solid fa-map"></i></div>
                        <div class="title">片区</div>
                    </a>
                </li>
                <%}%>

            </ul>

            <div class="logout_btn">
                <a href="logout">登出</a>
            </div>

        </div>
    </div>

    <div class="main_container">
        <div class="navbar">
            <div class="hamburger"><i class="fa-solid fa-bars"></i></div>
            <div class="logo">
                <a href="#">货物管理系统</a>
                <small class="version">Beta ver 1.0.0</small>
            </div>

        </div>


        <div class="content" id="workArea">
            <%
                int staffCount = 0;
                int adminCount = 0;
                for (Staff staff : new StaffServiceImpl().selectAllStaff()) {
                    staffCount++;
                    if (staff.getRoleID() == 1 || staff.getRoleID() == 2 || staff.getRoleID() == 3 || staff.getRoleID() == 4) {
                        adminCount++;
                    }
                }

                int cargoCount = 0;
                int cargoTypeCount = 0;
                for (Cargo cargo : new CargoServiceImpl().selectAllCargo()) {
                    cargoCount++;
                }
                for (CargoType cargoType : new CargoTypeServiceImpl().selectAllCargoType()) {
                    cargoTypeCount++;
                }
            %>
            <div class="info-container item">
                <div class="info-content">
                    <h2>员工统计</h2>
                    <div class="info-row">
                        <label>管理员数量</label>
                        <span><%= adminCount %></span>
                    </div>
                    <div class="info-row">
                        <label>职工数量</label>
                        <span><%= staffCount %></span>
                    </div>
                </div>
            </div>

            <div class="info-container item">
                <div class="info-content">
                    <h2>货物统计</h2>
                    <div class="info-row">
                        <label>货物数量</label>
                        <span><%= cargoCount %></span>
                    </div>
                    <div class="info-row">
                        <label>货物类型数量</label>
                        <span><%= cargoTypeCount %></span>
                    </div>
                </div>
            </div>


        </div>
        <div class="content" id="userManagement" style="display: none;">
            <%
                List<Staff> staffList = new StaffServiceImpl().selectAllStaff();

                int staff_count = 0;
                for (Staff staff : staffList) {
                    staff_count++;
                }
            %>


            <div class="operation">
                <div class="count">
                    <div class="count-content">
                        <div class="count-line">
                            <label>数量</label>
                            <span>(<%= staff_count %>)</span>
                        </div>
                        <a type="button" class="btn" href='staff_add.jsp'>新增</a>
                    </div>
                </div>

                <p id="search_count" style="padding-left: 20px">0</p>

                <div class="search">
                    <input type="text" id="searchInput" class="search-input" placeholder="ID搜索...">
                    <button type="button" class="btn" onclick="searchUser()">搜索</button>

                </div>
            </div>


            <% for (Staff staff : staffList) { %>

            <div class="info-container item">
                <div class="info-content">
                    <h2><%= staff.getStaffName() %>
                    </h2>

                    <div class="info-row">
                        <label>用户ID</label>
                        <span><%= staff.getStaffID() %></span>
                    </div>
                    <div class="info-row">
                        <label>用户名</label>
                        <span><%= staff.getUsername() %></span>
                    </div>
                    <div class="info-row">
                        <label>用户权限</label>
                        <span><%= new RoleServiceImpl().selectRole(staff.getRoleID()).getRoleName() %></span>
                    </div>
                    <div class="info-row">
                        <label>所在仓库</label>
                        <span><%= new WarehouseServiceImpl().selectWarehouse(staff.getWarehouseID()).getWarehouseName() %></span>
                    </div>
                    <div class="info-row">
                        <label>所属片区</label>
                        <span><%= new DistrictServiceImpl().selectDistrict(staff.getDistrictID()).getDistrictName() %></span>
                    </div>
                    <div class="info-row">
                        <label>用户描述</label>
                        <span><%= staff.getStaffRemark() %></span>
                    </div>
                    <div class="button-group">
                        <button type="button" onclick="window.location.href='pages/system-page/500.html'">查看详情</button>
                        <button type="button" onclick="window.location.href='staff?flag=staff_edit_pre&staff_id=<%= staff.getStaffID() %>'">修改信息
                        </button>
                    </div>
                </div>
            </div>

            <% } %>

            <div id="noResults" style="display: none;">没有找到匹配的结果</div>
        </div>

        <div class="content" id="cargoManagement" style="display: none;">

            <%
                List<Cargo> cargoList = new CargoServiceImpl().selectAllCargo();

                int cargo_count = 0;
                for (Cargo cargo : cargoList) {
                    cargo_count++;
                }
            %>
            <div class="operation">
                <div class="count">
                    <div class="count-content">
                        <div class="count-line">
                            <label>数量</label>
                            <span>(<%= cargo_count %>)</span>
                        </div>
                        <a type="button" class="btn add" href='#'>新增</a>
                    </div>
                </div>

                <div class="search">
                    <input type="text" class="search-input" placeholder="搜索...">
                    <button type="button" class="btn" onclick="searchCargo()">搜索</button>
                </div>
            </div>


            <% for (Cargo cargo : cargoList) { %>

            <div class="info-container item">
                <div class="info-content">
                    <h2><%= cargo.getCargoName() %>
                    </h2>

                    <div class="info-row">
                        <label>货物ID</label>
                        <span><%= cargo.getCargoID() %></span>
                    </div>
                    <div class="info-row">
                        <label>货物类型</label>
                        <span><%= new CargoTypeServiceImpl().selectCargoType(cargo.getCargoTypeID()).getCargoTypeName() %></span>
                    </div>
                    <div class="info-row">
                        <label>所在仓库</label>
                        <span><%= new WarehouseServiceImpl().selectWarehouse(cargo.getWarehouseID()).getWarehouseName() %></span>
                    </div>

                    <div class="info-row">
                        <label>货物描述</label>
                        <span><%= cargo.getCargoRemark() %></span>
                    </div>
                    <div class="button-group">
                        <button type="button" onclick="window.location.href='pages/system-page/500.html'">查看详情</button>
                        <button type="button" onclick="window.location.href='cargo?flag=cargo_edit_pre&cargo_id=<%= cargo.getCargoID() %>'">修改信息
                        </button>
                    </div>
                </div>
            </div>

            <% } %>

            <div id="noResults" style="display: none;">没有找到匹配的结果</div>

        </div>
        <div class="content" id="warehouseManagement" style="display: none;">
            <div class="operation">
                <div class="count">
                    <div class="count-content">
                        <div class="count-line">
                            <label>数量</label>
                            <span>()</span>
                        </div>
                        <a type="button" class="btn add" href='#'>新增</a>
                    </div>
                </div>

                <div class="search">
                    <input type="text" class="search-input" placeholder="搜索...">
                    <button type="button" class="btn">搜索</button>
                </div>
            </div>
            仓库管理
        </div>

        <div class="content" id="districtManagement" style="display: none;">
            <div class="operation">
                <div class="count">
                    <div class="count-content">
                        <div class="count-line">
                            <label>数量</label>
                            <span>()</span>
                        </div>
                        <a type="button" class="btn add" href='#'>新增</a>
                    </div>
                </div>

                <div class="search">
                    <input type="text" class="search-input" placeholder="搜索...">
                    <button type="button" class="btn">搜索</button>
                </div>
            </div>
            片区管理
        </div>
    </div>
</div>

</body>
</html>
