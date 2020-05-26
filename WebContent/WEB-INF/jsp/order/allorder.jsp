<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="utf-8">
    <title>财务管理-全部订单</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8"/>

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
        padding: 10px;
    }

    #add {
        display: none;
        margin-top: 10px;
    }

    .widths {
        width: 300px;
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
    <div class="layui-row"><%--action="${ctx}/Hotelm/allorder.do"--%>
        <form class="layui-form layui-col-md12">
            <div class="layui-input-inline">
                <input type="text" name="platform" id="platform" placeholder="平台" autocomplete="off"
                       class="layui-input" style="width: 200px;" value="${platform}">
            </div>
            <div class="layui-input-inline">
                <input type="text" name="order" id="order" placeholder="订单号" autocomplete="off"
                       class="layui-input" style="width: 200px;" value="${order}">
            </div>
            <div class="layui-input-inline">
                <input type="text" name="reserName" id="reserName" placeholder="预定人名" autocomplete="off"
                       class="layui-input" style="width: 200px;" value="${reserName}">
            </div>
            <div class="layui-input-inline">
                <input type="text" name="passName" id="passName" placeholder="入住人名" autocomplete="off"
                       class="layui-input " style="width: 200px;" value="${passName}">
            </div>
            <div class="layui-input-inline"><%--1未确认 2已确认 3 已撤销 4待入住 5已入住 6退房--%>
                <label class="layui-form-label"><span lang>status</span>:</label>
                <div class="layui-input-block widths">
                    <select name="status" lay-verify="required" id="status" lay-filter="status">
                        <option value="1" <c:if test="${status==1}"> selected</c:if> lang>未确认</option>
                        <option value="2" <c:if test="${status==2}"> selected</c:if> lang>已确认</option>
                        <option value="3" <c:if test="${status==3}"> selected</c:if> lang>已取消</option>
                        <option value="5" <c:if test="${status==5}"> selected</c:if> lang>已入住</option>
                        <option value="6" <c:if test="${status==6}"> selected</c:if> lang>已退房</option>
                        <option value="0" <c:if test="${status==0}"> selected</c:if> lang>已到账</option>
                    </select>
                </div>
            </div>
            <div class="layui-btn" lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></div>
        </form>

    </div>
    <table class="layui-table">
        <thead>
        <tr>
            <th lang>serial</th>
            <th lang>patform</th>
            <th lang>orderNumber</th>
            <th lang>roomNumber</th>
            <th lang>orderTime</th>
            <th lang>orderday</th>
            <th lang>roomPrice</th>
            <th lang>receivable</th>
            <th lang>Reservations</th>
            <th lang>Subscriber</th>
            <c:if test="${status!=0}"><%--到账--%>
                <th lang>passenger</th>
                <th lang>phone</th>
            </c:if>
            <th lang>operation</th>
        </tr>
        <c:forEach items="${list.result}" var="item">
            <tr>
                <input type="hidden" name="idstr" value="${item.id}">
                <th>${item.id}</th>
                <th>${item.platformName}</th>
                <th onclick="updateOrder(${item.id},${item.status })">${item.orderNumber}</th>
                <c:if test="${item.type==2}">
                    <th  onclick="updateOrder(${item.id},${item.status })">${item.guestRoomLevel}</th>
                </c:if>
                <c:if test="${item.type!=2}">
                    <th  onclick="updateOrder(${item.id},${item.status })">${item.roomNumber}</th>
                </c:if>
                <th>${item.checkintime}-<br>${item.checkouttime}</th>
                <th>${item.checkinDay}</th>
                <c:if test="${item.type==2}">
                    <th></th>
                </c:if>
                <c:if test="${item.type!=2}">
                <th>${item.referencePrice}</th>
                </c:if>
                <c:if test="${item.currency==1}">
                    <c:if test="${item.isdao==1}">
                        <th onclick="isdao(${item.id})" style="color: #8a3104;">${item.money}(RMB)</th>
                    </c:if>
                    <c:if test="${item.isdao!=1}">
                        <th>${item.money}(RMB)</th>
                    </c:if>
                </c:if>
                <c:if test="${item.currency==2}">
                    <c:if test="${item.isdao==1}">
                        <th onclick="isdao(${item.id})" style="color: #8a3104;">${item.money}(PHP)</th>
                    </c:if>
                    <c:if test="${item.isdao!=1}">
                        <th>${item.money}(PHP)</th>
                    </c:if>
                </c:if>
                <th>${item.name}</th>
                <th>${item.phoneNumber}</th>
                <c:if test="${status!=0}">
                    <th>${item.reserationName}</th>
                    <th>${item.mobile}</th>
                </c:if>
                <th>
                    <c:if test="${item.status==1}">
                        <div class=" layui-btn layui-btn-normal layui-btn-sm toadd" onclick="confirmOrder(${item.id })"
                             lang>confirm</div>
                        <div class=" layui-btn layui-btn-normal layui-btn-sm toadd" onclick="cancelOrder(${item.id })"
                             lang>cancel</div>
                        <div class=" layui-btn layui-btn-normal layui-btn-sm toadd"
                             onclick="updateOrder(${item.id },${item.status })" lang>amended</div>
                    </c:if>
                    <c:if test="${item.status==2}">
                        <div class=" layui-btn layui-btn-normal layui-btn-sm toadd" onclick="checkin(${item.id})" lang>ins</div>
                        <div class=" layui-btn layui-btn-normal layui-btn-sm toadd" onclick="cancelOrder(${item.id })"
                             lang>cancel</div>
                        <div class=" layui-btn layui-btn-normal layui-btn-sm toadd"
                             onclick="updateOrder(${item.id },${item.status })" lang>amended</div>
                    </c:if>
                        <%-- <c:if test="${item.status==3}">
                             <div class=" layui-btn layui-btn-normal layui-btn-sm toadd"
                                  onclick="add()" lang>Cancelled</div>
                         </c:if>--%>
                    <c:if test="${item.status==5}">
                        <div class=" layui-btn layui-btn-normal layui-btn-sm toadd" onclick="checkout(${item.id })"
                             lang>out</div>
                        <div class=" layui-btn layui-btn-normal layui-btn-sm toadd"
                             onclick="updateOrder(${item.id },${item.status })" lang>amended</div>
                    </c:if>
                </th>
                    <%--<th>
                        <div class=" layui-btn layui-btn-normal layui-btn-sm toadd"
                             onclick="add(${item.id},${item.yearM})">
                        </div>
                    </th>--%>
            </tr>
        </c:forEach>
        </thead>
    </table>

    <div class="span11">
        <div class="row-fluid">
            <div class="tcdPageCode" style="text-align:center;"></div>
        </div>
    </div>
</div>

<div id="add" class="layui-fluid" style="display: none">
    <form class="layui-form" autocomplete="off" lay-filter="test">
        <div class="layui-form-item">
            <label class="layui-form-label"><span lang>name</span>:</label>
            <div class="layui-input-block widths">
                <input type="hidden" name="orderId" id="orderId"/>
                <input type="text" name="name" id="name" class="layui-input " lay-verify="required">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label"><span lang>genderName</span>:</label>
            <div class="layui-input-block widths">
                <input type="text" name="gender" id="gender" value="" class="layui-input">

            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span lang>phone</span>:</label>
            <div class="layui-input-block widths">
                <input type="text" name="phoneNumber" id="phoneNumber" class="layui-input" value=""
                       lay-verify="required">
            </div>
        </div>


        <div class="layui-form-item">
            <div class="layui-input-block">
                <div class="layui-btn" lay-submit lay-filter="addMenu" lang>Submission</div>
            </div>
        </div>

    </form>
</div>



<!-- 添加 -->
<script>
    /* 分页要用的 */
    $(".tcdPageCode").createPage({
        pageCount:${list.totalPage},
        current:${list.currentPage},
        backFn: function (p) {
         var platform = document.getElementById("platform").value;
            var order = document.getElementById("order").value;
            var reserName = document.getElementById("reserName").value;
            var passName = document.getElementById("passName").value;
            var status = document.getElementById("status").value;
            location.href = "${ctx}/Order/allorder.do?platform=" + platform + "&order=" + order + "&reserName="
                + reserName + "&passName=" + passName + "&status=" + status + "&currentPage=" + p;
        }
    });

    function add() {
        index = layer.open({
            type: 1,
            area: ['40%', '45%'],
            anim: 2,
            title: '录入入住人信息',
            maxmin: true,
            shadeClose: true,
            content: $("#add")
        });
    }
</script>
<script type="text/javascript">

    $(document).ready(function () {
        /*  $("#span").val(getNowFormatDate());*/
        var time = getNowFormatDate();
        $("#span").html(time);

        function getNowFormatDate() {
            var date = new Date();
            var seperator1 = "-";
            var year = date.getFullYear();
            var month = date.getMonth() + 1;
            var strDate = date.getDate();
            if (month >= 1 && month <= 9) {
                month = "0" + month;
            }
            if (strDate >= 0 && strDate <= 9) {
                strDate = "0" + strDate;
            }
            var currentdate = year + seperator1 + month + seperator1 + strDate;
            return currentdate;
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
        var falg;
        form.on('submit(update_add)', function (obj) {
            var param = obj.field;

            $.ajax({
                cache: false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                type: "POST",                                           //上面3行都是必须要的
                url: '${ctx}/Order/addFinance.do',       //地址 type 带参数
                data: param,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                async: false,                                          // 是否 异步 提交
                success: function (result) {                          // 不出现异常 进行立面方
                    if (result != 1) {
                        /*alert("新增失败"+' \n '+"Failed to add");        */             //提示框
                        /* document.getElementById("name").value="";     //这个id的文本框的值 将会清空
                         document.getElementById("name").focus(); */     // 给这个id的文本框提供焦点
                        return false;
                    } else {
                        alert("新增成功！" + ' \n ' + "succeeded");
                        location.href = '${ctx}/Order/myfinance.do';
                        return true;
                    }
                },
                error: function (data) {
                }
            })
        });

        form.on('submit(search)', function () {
            var platform = document.getElementById("platform").value;
            var order = document.getElementById("order").value;
            var reserName = document.getElementById("reserName").value;
            var passName = document.getElementById("passName").value;
            var status = document.getElementById("status").value;
            location.href = "${ctx}/Order/allorder.do?platform=" + platform + "&order=" + order + "&reserName="
                + reserName + "&passName=" + passName + "&status=" + status;
        });


        //下拉框选择改变事件
        form.on('select(status)', function (data) {
            var platform = document.getElementById("platform").value;
            var order = document.getElementById("order").value;
            var reserName = document.getElementById("reserName").value;
            var passName = document.getElementById("passName").value;
            /*  var status = document.getElementById("status").value;*/
            location.href = "${ctx}/Order/allorder.do?platform=" + platform + "&order=" + order + "&reserName="
                + reserName + "&passName=" + passName + "&status=" + data.value;

        });

        window.isdao = function (value) {
            var r = confirm("确认收款吗？");
            if (r) {
                $.ajax({
                    cache: false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                    type: "POST",                                           //上面3行都是必须要的
                    url: '${ctx}/Order/isdao.do',       //地址 type 带参数
                    data: "id=" + value,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                    async: false,                                          // 是否 异步 提交
                    success: function (result) {
                        var platform = document.getElementById("platform").value;
                        var order = document.getElementById("order").value;
                        var reserName = document.getElementById("reserName").value;
                        var passName = document.getElementById("passName").value;
                        var status = document.getElementById("status").value;
                        location.href = "${ctx}/Order/allorder.do?platform=" + platform + "&order=" + order + "&reserName="
                            + reserName + "&passName=" + passName + "&status=" + status;
                    }
                })
            }

        }

        window.updateOrder = function (value, value2) {
            window.location = '${ctx}/Order/toupdate.do?id=' + value + '&status=' + value2;

        }
        window.confirmOrder = function (value) {
            $.ajax({
                cache: false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                type: "POST",                                           //上面3行都是必须要的
                url: '${ctx}/Order/updateStatus.do',       //地址 type 带参数
                data: "orderNumber=" + value + "&status=2",                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                async: false,                                          // 是否 异步 提交
                success: function (result) {                          // 不出现异常 进行立面方
                    var platform = document.getElementById("platform").value;
                    var order = document.getElementById("order").value;
                    var reserName = document.getElementById("reserName").value;
                    var passName = document.getElementById("passName").value;
                    var status = document.getElementById("status").value;
                    location.href = "${ctx}/Order/allorder.do?platform=" + platform + "&order=" + order + "&reserName="
                        + reserName + "&passName=" + passName + "&status=" + status;
                }
            })
        }
        window.cancelOrder = function (value) {
            $.ajax({
                cache: false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                type: "POST",                                           //上面3行都是必须要的
                url: '${ctx}/Order/updateStatus.do',       //地址 type 带参数
                data: "orderNumber=" + value + "&status=3",                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                async: false,                                          // 是否 异步 提交
                success: function (result) {                          // 不出现异常 进行立面方
                    var platform = document.getElementById("platform").value;
                    var order = document.getElementById("order").value;
                    var reserName = document.getElementById("reserName").value;
                    var passName = document.getElementById("passName").value;
                    var status = document.getElementById("status").value;
                    location.href = "${ctx}/Order/allorder.do?platform=" + platform + "&order=" + order + "&reserName="
                        + reserName + "&passName=" + passName + "&status=" + status;
                }
            })
        }

        window.checkin = function (value) {
            form.val('test', {
                "orderId": value
                /* "roomId":list.roomId,
                 "cid":list.cid*/
            });
            add();


        }

        //退房
        window.checkout = function (value2) {
            var time;
            layer.prompt({
                formType: 0,
                value: '12:00-14:00',
                title: '请输入值',
                area: ['800px', '350px'] //自定义文本域宽高
            }, function (value, index, elem) {
                time = value;
                if (value.indexOf("-") == -1) {
                    alert("格式不正确"); //得到value
                }
                alert(value); //得到value
                $.ajax({
                    cache: false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                    type: "POST",                                           //上面3行都是必须要的
                    url: '${ctx}/Order/updateStatus.do',       //地址 type 带参数
                    data: "orderNumber=" + value2 + "&status=6&time=" + time,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                    async: false,                                          // 是否 异步 提交
                    success: function (result) {                          // 不出现异常 进行立面方
                        var platform = document.getElementById("platform").value;
                        var order = document.getElementById("order").value;
                        var reserName = document.getElementById("reserName").value;
                        var passName = document.getElementById("passName").value;
                        var status = document.getElementById("status").value;
                        location.href = "${ctx}/Order/allorder.do?platform=" + platform + "&order=" + order + "&reserName="
                            + reserName + "&passName=" + passName + "&status=" + status;
                    }
                })
                layer.close(index);
            });
        }

        form.on('submit(addMenu)', function (obj) {
            var param= obj.field;
            $.ajax({
                cache: false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                type: "POST",                                           //上面3行都是必须要的
                url: '${ctx}/Order/register.do',       //地址 type 带参数
                data: param,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                async: false,                                          // 是否 异步 提交
                success: function (result) {                          // 不出现异常 进行立面方
                    var platform = document.getElementById("platform").value;
                    var order = document.getElementById("order").value;
                    var reserName = document.getElementById("reserName").value;
                    var passName = document.getElementById("passName").value;
                    var status = document.getElementById("status").value;
                    location.href = "${ctx}/Order/allorder.do?platform=" + platform + "&order=" + order + "&reserName="
                        + reserName + "&passName=" + passName + "&status=" + status;
                }
            });
        });


    })


    function timestampToTime(timestamp) {
        var date = new Date(timestamp);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
        Y = date.getFullYear() + '-';
        M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
        D = date.getDate() + ' ';
        h = date.getHours() + ':';
        m = date.getMinutes() + ':';
        s = date.getSeconds();
        return Y + M + D + h + m + s;
    }
</script>
</body>


</html>
