<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set  value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta charset="utf-8">
		<title>财务管理-财务</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8" />
		<link rel="stylesheet" href="${ctx}/js/layui/css/layui.css" media="all"/>
		<link rel="stylesheet" href="${ctx}/css/index.css"/>
		<link rel="stylesheet" href="${ctx}/css/administration.css"/>
		<link rel="stylesheet" href="${ctx}/css/ht.css"/>
		<link rel="stylesheet" href="${ctx}/js/layui/css/modules/layui-icon-extend/iconfont.css"/>
		<script src="${ctx}/js/jquery.min.js"></script>
		<script src="${ctx}/js/layui/layui.all.js"></script>
		<script src="${ctx}/js/weeklyCalendar.js"></script>
		<script type="text/javascript" src="${ctx}/js/easyui/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="${ctx}/js/language.js"></script>
		<%--<script type="text/javascript" src="${ctx}/js/layui/layui_exts/excel.js"></script>--%>

		<script type="text/javascript" src="${ctx}/js/page.js"></script>
		<link rel="stylesheet" href="${ctx}/css/page.css" type="text/css"></link>
	</head>
	<style>
		.x-body {
			padding: 20px;
		}
		.x-body {
			padding: 20px;
		}
		#add_apar {
			display: none;
			margin-top: 10px;
		}
		.widths{
			width: 300px;
		}
		#modify_apar {
			display: none;
			margin-top: 10px;
		}
	</style>
	<body>
		<div class="x-body">
			<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large" style="display: none">
				<button class="btn btn-small btn-success" id="enBtn">
					English
				</button>
				<button class="btn btn-small btn-success" id="zhBtn">
					简体中文
				</button>
			</div>
			<div class="layui-row">
				<form class="layui-form layui-col-md12">
					<div class="layui-input-inline">
						<%--<input type="text" name="platform" id="platform" placeholder="平台" autocomplete="off"
                               class="layui-input" style="width: 200px;" value="${platform}">--%>
						<select name="platform"  id="platform">
							<option value="">请选择平台</option>
							<c:forEach items="${plist}" var="list">
								<option value="${list.id}">${list.name}</option>
							</c:forEach>
						</select>
					</div>
					<div class="layui-input-inline">
						<input type="text" name="orderNumber" id="orderNumber" value="${orderNumber}" placeholder="订单号" autocomplete="off" class="layui-input" style="width: 200px;">
					</div>
					<div class="layui-input-inline">
						<input type="text" name="roomName" id="roomName" value="${roomName}" placeholder="房间" autocomplete="off" class="layui-input" style="width: 200px;">
					</div>
					<div class="layui-input-inline">
						<input type="text" name="time" id="time" value="${time}" placeholder="时间(天)" autocomplete="off" class="layui-input time" style="width: 200px;">
					</div>
					<div class="layui-input-inline">
						<input type="text" name="reserName" id="reserName" value="${reserName}" placeholder="预定人" autocomplete="off" class="layui-input" style="width: 200px;">
					</div>
					<div class="layui-input-inline">
						<input type="text" name="passName" id="passName" value="${passName}" placeholder="入住人" autocomplete="off" class="layui-input" style="width: 200px;">
					</div>
					<div class="layui-btn" lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></div>
				</form>
			</div>
			<table class="layui-table">
				<thead>
				<tr>
					<th lang>patform</th>
					<th lang>orderNumber</th>
					<th lang>roomNumber</th>
					<th lang>orderTime</th>
					<th lang>orderday</th>
					<th lang>receivable</th>
					<th lang>deposit</th>
					<th lang>roomPrice</th>
					<th lang>cost</th>
				</tr>
				<c:forEach items="${list.result}" var="item">
				<tr>
					<th>${item.platformName}</th>
					<th>${item.orderNumber}</th>
					<c:if test="${item.type==2}">
						<th>${item.guestRoomLevel}</th>
					</c:if>
					<c:if test="${item.type!=2}">
						<th>${item.roomNumber}</th>
					</c:if>
					<th>${item.checkintime}<br>${item.checkouttime}</th>
					<th>${item.checkinDay}</th>
					<c:if test="${item.currency==1}">
						<c:if test="${item.isdao==1}"><%--未到账--%>
							<th style="color: #8a3104">(RMB)${item.money}</th>
						</c:if>
						<c:if test="${item.isdao==2}"><%--到账--%>
							<th>(RMB)${item.money}</th>
						</c:if>

					</c:if>
					<c:if test="${item.currency==2}">
						<c:if test="${item.isdao==1}"><%--未到账--%>
							<th style="color: #8a3104">(PHP)${item.money}</th>
						</c:if>
						<c:if test="${item.isdao==2}"><%--到账--%>
							<th>(PHP)${item.money}</th>
						</c:if>
					</c:if>
					<c:if test="${item.depositSattus!=1}">
						<th>${item.deposit}</th>
					</c:if>
					<c:if test="${item.depositSattus==1}"><%--扣除--%>
						<th style="color: #8a3104">${item.deposit}</th>
					</c:if>
					<c:if test="${item.type==2}">
						<th></th>
					</c:if>
					<c:if test="${item.type!=2}">
					<th>${item.referencePrice}</th>
					</c:if>
					<c:if test="${item.type!=2}">
					<th>(RMB)${item.referencePrice*item.checkinDay}</th>
					</c:if>
					<c:if test="${item.type==2}"><%--合约--%>
						<th></th>
					</c:if>
				</tr>
				</c:forEach>
				<tr>
					<th></th><th></th>
						<th><span lang>receivable</span>(RMB)</th>
						<th>${receivableRMB}</th>
						<th><span lang>Received</span>(RMB)</th>
						<th>${ReceivedRMB}</th>
						<th><span lang>Uncollected</span>(RMB)</th>
						<th>${UncollectedRMB}</th>
					<th></th>
				</tr>
				<tr>
					<th></th><th></th>
					<th><span lang>receivable</span>(PHP)</th>
					<th>${receivablePHP}</th>
					<th><span lang>Received</span>(PHP)</th>
					<th>${ReceivedPHP}</th>
					<th><span lang>Uncollected</span>(PHP)</th>
					<th>${UncollectedPHP}</th>
					<th></th>
				</tr>
				<tr>
					<th></th><th></th><th></th>
					<th></th><th></th><th></th>
					<th lang>deposits</th>
					<th>${deposit}</th>
					<th></th>
				</tr>

				</thead>
			</table>
			<div class="span11">
				<div class="row-fluid">
					<div class="tcdPageCode" style="text-align:center;"></div>
				</div>
			</div>
		</div>
	</body>
	<script>
        /* 分页要用的 */
        $(".tcdPageCode").createPage({
            pageCount:${list.totalPage},
            current:${list.currentPage},
            backFn: function (p) {
                var platform = document.getElementById("platform").value;
                var roomName = document.getElementById("roomName").value;
                var orderNumber = document.getElementById("orderNumber").value;
                var time = document.getElementById("time").value;
                var reserName = document.getElementById("reserName").value;
                var passName = document.getElementById("passName").value;
                location.href = "${ctx}/Order/financetwo.do?roomName=" + roomName + "&orderNumber=" + orderNumber + "&time="
                    + time + "&reserName=" + reserName + "&passName=" + passName + "&currentPage=" + p+"&platform="+platform;
            }
        });
	</script>
	<script>
        layui.use(['form', 'table', 'element', 'laydate'], function () {
            var form = layui.form,
                element = layui.element,
                table = layui.table;
            laydate = layui.laydate;


            element.init();
            form.render()
            $('.time').each(function () {
                laydate.render({
                    elem: this,
                    type: 'date'
                });
            })

            form.on('submit(search)', function () {
                var platform = document.getElementById("platform").value;
                var roomName = document.getElementById("roomName").value;
                var orderNumber = document.getElementById("orderNumber").value;
                var time = document.getElementById("time").value;
                var reserName = document.getElementById("reserName").value;
                var passName = document.getElementById("passName").value;
                location.href = "${ctx}/Order/financetwo.do?roomName=" + roomName + "&orderNumber=" + orderNumber + "&time="
                    + time + "&reserName=" + reserName + "&passName=" + passName+"&platform="+platform ;
            });
		})
	</script>
</html>
