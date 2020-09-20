<%@page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<p align="center">当前用户：${user.name}</p>
<table align='center' border='1' cellspacing='0'>
    <tr>
        <td>id</td>
        <td>名称</td>
        <td>价格</td>
        <td>购买</td>
    </tr>
    <c:forEach items="${products}" var="product" varStatus="i">
        <tr>
            <td>${product.id}</td>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td>
                数量<input type="text" value="1" name="num" class="num"/>
                    <input type="hidden" value="${product.id}" name="pid" class="pid"/>
                    <input type="submit" value="加入购物车" class="btn"/>
            </td>
        </tr>
    </c:forEach>
    <tr>
        <td colspan="4" align="center"><a href="listOrderItem">查看购物车</a></td>
    </tr>
</table>
<script>
    var btns = document.getElementsByClassName("btn");
    for(let i = 0;i < btns.length;i++){
        btns[i].onclick = function(){
            btns[i].disabled=true;
            var pid = document.getElementsByClassName("pid")[i].value;
            var num = document.getElementsByClassName("num")[i].value;
            var xhr = new XMLHttpRequest();
            /* xhr.onreadystatechange=function(){
                if(xhr.readyState==4&&xhr.status==200){
                    alert(xhr.reponseText);
                }
            }; */
            xhr.open('post','addOrderItem?num='+num+"&pid="+pid);
            xhr.send(null);
        }
    }
</script>