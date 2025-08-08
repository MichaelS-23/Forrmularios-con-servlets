<%@ page import="java.util.Map" %>
<%@page contentType="text/html" pageEncoding="utf-8" %>


<%Map<String, String> errores = (Map<String, String>) request.getAttribute("errores");%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">

</head>
<body>


<h3>Formulario de usuarios</h3>


<%if (errores != null && errores.size() > 0) {%>
<ul class="alert alert-danger mx-4"  >
    <%for (String error : errores.values()) {%>
    <li><%=error%>
    </li>
    <% } %>
</ul>
<%}%>
<div class="px-4">
    <form action="/webapp_form/registro" method="post">


        <div class="row mb-3">
            <label class="col-form-label col-sm-2" for="username">Usuario</label>
            <div class="col-sm-4">
                <input type="text" name="username" id="username" class="form-control">
            </div>
        </div>
            <%
                if (errores != null && errores.containsKey("username")) {
                    out.println("<div class='row mb-3 alert alert-danger col-sm-4' style= 'color:red;'>" + errores.get("username") + "</div>" );
                }
            %>
        <div class="row mb-3">
            <label class="col-form-label col-sm-2" for="password">Contraseña</label>
            <div class="col-sm-4">
                <input type="password" name="password" id="password" class="form-control">
            </div>
        </div>
            <%
                if (errores != null && errores.containsKey("password")) {
                    out.println("<div class='row mb-3 alert alert-danger col-sm-4' style= 'color:red;'>" + errores.get("password") + "</div>");
                }
            %>
        <div class="row mb-3">
            <label class="col-form-label col-sm-2" for="email">Correo</label>
            <div class="col-sm-4">
                <input type="text" name="email" id="email" class="form-control">
            </div>
        </div>
            <%
                if (errores != null && errores.containsKey("email")) {
                    out.println("<div class='row mb-3 alert alert-danger col-sm-4' style= 'color:red;'>" + errores.get("email") + "</div>");
                }
            %>
        <div class="row mb-3">
            <label class="col-form-label col-sm-2" for="country">País</label>
            <div class="col-sm-4">
                <select class="form-select" name="country" id="country">
                    <option value="">--Selecionar--</option>
                    <option value="CO">Colombia</option>
                    <option value="PE">Perú</option>
                    <option value="VE">Venezuela</option>
                </select>
            </div>
        </div>
            <%
                if (errores != null && errores.containsKey("country")) {
                    out.println("<div class='row mb-3 alert alert-danger col-sm-4' style= 'color:red;'>" + errores.get("country") + "</div>");
                }
            %>
        <div class="row mb-3">
            <label class="col-form-label col-sm-2" for="jordan">Siluetas favoritas</label>
            <div class="col-sm-4">
                <select class="form-select" name="jordan" id="jordan" multiple>
                    <option value="1">Air Jordan 1</option>
                    <option value="2">Air Jordan 2</option>
                    <option value="3">Air Jordan 3</option>
                    <option value="4">Air Jordan 4</option>
                    <option value="5">Air Jordan 5</option>
                    <option value="9">Air Jordan 9</option>
                    <option value="11">Air Jordan 11</option>
                </select>
            </div>
        </div>
            <%
                if (errores != null && errores.containsKey("jordan")) {
                    out.println("<div class='row mb-3 alert alert-danger col-sm-4' style= 'color:red;'>" + errores.get("jordan") + "</div>");
                }
            %>
        <div class="row mb-3">
            <div>
                <input type="submit" value="Enviar" class="btn btn-primary">
            </div>
        </div>
    </form>

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q"
        crossorigin="anonymous"></script>
</body>
</html>