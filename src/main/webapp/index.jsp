<%@ page import="java.util.Map" %>
<%@page contentType="text/html" pageEncoding="utf-8" %>


<%Map<String, String> errores = (Map<String, String>) request.getAttribute("errores");%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>


<h3>Formulario de usuarios</h3>


<%if (errores != null && errores.size() > 0) {%>
<ul>
    <%for (String error : errores.values()) {%>
    <li><%=error%>
    </li>
    <% } %>
</ul>
<%}%>
<form action="/webapp_form/registro" method="post">


    <div>
        <label for="username">Usuario</label>
        <div>
            <input type="text" name="username" id="username">
        </div>
        <%
            if (errores != null && errores.containsKey("username")) {
                out.println("<small style= 'color:red;'>" + errores.get("username") + "</small>");
            }
        %>
    </div>
    <div>
        <label for="password">Contraseña</label>
        <div>
            <input type="password" name="password" id="password">
        </div>
        <%
            if (errores != null && errores.containsKey("password")) {
                out.println("<small style= 'color:red;'>" + errores.get("password") + "</small>");
            }
        %>
    </div>
    <div>
        <label for="email">Correo</label>
        <div>
            <input type="text" name="email" id="email">
        </div>
        <%
            if (errores != null && errores.containsKey("email")) {
                out.println("<small style= 'color:red;'>" + errores.get("email") + "</small>");
            }
        %>
    </div>
    <div>
        <label for="country">País</label>
        <div>
            <select name="country" id="country">
                <option value="">--Selecionar--</option>
                <option value="CO">Colombia</option>
                <option value="PE">Perú</option>
                <option value="VE">Venezuela</option>
            </select>
        </div>
        <%
            if (errores != null && errores.containsKey("country")) {
                out.println("<small style= 'color:red;'>" + errores.get("country") + "</small>");
            }
        %>
    </div>
    <div>
        <label for="jordan">Siluetas favoritas</label>
        <div>
            <select name="jordan" id="jordan" multiple>
                <option value="1">Air Jordan 1</option>
                <option value="2">Air Jordan 2</option>
                <option value="3">Air Jordan 3</option>
                <option value="4">Air Jordan 4</option>
                <option value="5">Air Jordan 5</option>
                <option value="9">Air Jordan 9</option>
                <option value="11">Air Jordan 11</option>
            </select>
        </div>
        <%
            if (errores != null && errores.containsKey("jordan")) {
                out.println("<small style= 'color:red;'>" + errores.get("jordan") + "</small>");
            }
        %>
    </div>
    <div>
        <div>
            <input type="submit" value="Enviar">
        </div>
    </div>
</form>
</body>
</html>