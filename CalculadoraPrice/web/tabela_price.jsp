<%-- 
    Document   : index.jsp
    Created on : 22 de mar. de 2021, 20:54:18
    Author     : ROGERIODEPAULAREBELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.lang.Math" %>

<!DOCTYPE html>

<%
  double pv, n, saldo, i, pmt, juros, amort, n0 = 0.0;
  int nI =0;
  List<Double> saldoList = new ArrayList<>();
  List<Double> pmtList = new ArrayList<>();
  List<Double> jurosList = new ArrayList<>();
  List<Double> amortList = new ArrayList<>();

  String errorMessage = null;
  try{
        pv = Double.parseDouble(request.getParameter("pv"));
        saldo = pv;
        n = Double.parseDouble(request.getParameter("n"));
        nI = (int)n;
        i = (Double.parseDouble(request.getParameter("i")))/100;
        pmt = Math.round((pv*( i / (1 - Math.pow((1+i),-n))))*100d)/100d;
      
        saldoList.add(saldo);
        pmtList.add(n0);
        jurosList.add(n0);
        amortList.add(n0);
        
        for(int aux = 0; aux < nI; aux++){
        
        juros = Math.round((saldo * i) *100d)/100d;
        amort = Math.round((pmt - juros)*100d)/100d;    
        saldo = Math.round(((saldo*(1+i) ) - pmt)*100d)/100d;
        
        saldoList.add(saldo);
        pmtList.add(pmt);
        jurosList.add(juros);
        amortList.add(amort);
        }
  }
  catch (Exception ex) {errorMessage = "Valor Inválido";}
%>           
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calculadora Price</title>
    </head>
    <body>
       
        <%@include file="WEB-INF/jspf/header.jspf" %>
         <%@include file="WEB-INF/jspf/menu.jspf" %>
         
        <h3>Tabela</h3>
        
        <%if (errorMessage != null) {%>
              <div style="color:red">
                  <%= errorMessage %>
              </div>
        <% }else{ %>
          <table border="1" style="align-content:center; margin-left: 100px;">
            <tr>
                <th>Período(Mês)</th>
                <th>Saldo</th>
                <th>Parcela</th>
                <th>Juros</th>
                <th>Amortização</th>
            </tr>
        <% for (int aux2 = 0; aux2 < pmtList.size(); aux2++){
        %>
            <tr>
                <td><%= aux2  %></td>
                <td><%= saldoList.get(aux2) %></td>
                <td><%= pmtList.get(aux2)   %></td>
                <td><%= jurosList.get(aux2) %></td>
                <td><%= amortList.get(aux2) %></td>
            </tr>
          <%} %>
          </table>
        <% }
        for(int aux3 = nI; aux3 > 0; aux3--){
        saldoList.remove(aux3);
        pmtList.remove(aux3);
        jurosList.remove(aux3);
        amortList.remove(aux3);
        }
        %>
          <h3>Novo Cálculo</h3>
        <form action="">
            Valor do Empréstimo <input type="number" name="pmt">
            Parcelas <input type="number" name="n">
            Taxa de Juros <input type="number" name="i">
            <input type="submit" value="Calcular">
        </form>
        
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
