<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<div class="navbar">
    <div class="navbar-inner">
            <ul class="nav pull-right">
                <li><a href="${contextPath}/config" class="hidden-phone visible-tablet visible-desktop" role="button">系统设置</a></li>
                <li id="fat-menu" class="dropdown">
                    <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="icon-user"></i> ${currentUser.username}
                        <i class="icon-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a tabindex="-1" href="#">My Account</a></li>
                        <li class="divider"></li>
                        <li class="divider visible-phone"></li>
                        <li><a tabindex="-1" href="${contextPath}/account/changePasswordPage">修改密码</a></li>
                        <li class="divider"></li>
                        <li class="divider visible-phone"></li>
                        <li>
							<a tabindex="-1" href="${contextPath}/account/logoff" onclick="$('#logoutForm').submit();">登出</a>
                        </li>
                    </ul>
                </li>
                
            </ul>
            <a class="brand" href="${contextPath}/"><span class="first">赣州市</span> <span class="first">土地管理系统</span></a>
    </div>
</div>