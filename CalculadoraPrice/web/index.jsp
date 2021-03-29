<%-- 
    Document   : index.jsp
    Created on : 22 de mar. de 2021, 20:54:18
    Author     : ROGERIODEPAULAREBELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calculadora Price</title>
    </head>
    <body>
        
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        
        <h3>Calcule o valor das parcelas</h3>
       <form action="tabela_price.jsp">
            Valor do Empréstimo <input type="number" name="pv">
            Parcelas <input type="number" name="n">
            Taxa de Juros <input type="number" name="i">
            <input type="submit" value="Calcular">
        </form>
        
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
