<%@ page import="entity.District" %>
<%@ page import="java.util.List" %>
<%@ page import="service.impl.DistrictServiceImpl" %><%--
  Created by IntelliJ IDEA.
  User: Shey
  Date: 12/12/2023
  Time: 17:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="content" id="districtManagement" style="display: none;">
    <%
        List<District> districtList = new DistrictServiceImpl().selectAllDistrict();

        int district_count = 0;
        for (District district : districtList) {
            district_count++;
        }
    %>
    <div class="operation">
        <div class="count">
            <div class="count-content">
                <div class="count-line">
                    <label>数量</label>
                    <span>(<%= district_count %>)</span>
                </div>
                <%--                        <a type="button" class="btn add" href='#'>新增</a>--%>
            </div>
        </div>

        <div class="search">
            <input type="text" id="DistrictSearchInput" class="search-input" placeholder="搜索...">
            <button type="button" class="btn" onclick="DistrictSearch()">搜索重置</button>
        </div>
    </div>


    <% for (District district : districtList) { %>

    <div class="info-container item">
        <div class="info-content">
            <h2><%= district.getDistrictName() %>
            </h2>

            <div class="info-row">
                <label>片区ID</label>
                <span><%= district.getDistrictID() %></span>
            </div>
            <div class="info-row">
                <label>仓库数量</label>
                <span><%= new DistrictServiceImpl().selectWarehouseCount(district.getDistrictID()) %></span>
            </div>
            <div class="info-row">
                <label>用户数量</label>
                <span><%= new DistrictServiceImpl().selectStaffCount(district.getDistrictID()) %></span>
            </div>

            <%--                    <div class="button-group">--%>
            <%--                        <button type="button" onclick="location.href='pages/system-page/500.html'">查看详情</button>--%>
            <%--                        <button type="button"--%>
            <%--                                onclick="location.href='district?flag=district_edit_pre&district_id=<%= district.getDistrictID() %>'">修改信息--%>
            <%--                        </button>--%>
            <%--                    </div>--%>
        </div>
    </div>

    <% } %>

</div>
