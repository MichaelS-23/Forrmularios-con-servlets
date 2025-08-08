package com.mike.apiservlet.webapp.form;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;


@WebServlet("/registro")
public class FormServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String country = req.getParameter("country");
        String[] jordan = req.getParameterValues("jordan");



        Map<String, String> errores = new HashMap<>();

        if (username == null || username.isBlank()) {
            errores.put("username","El nombre de usuario es requerido");
        }

        if (password == null || password.isBlank()) {
            errores.put("password","La contraseña es requerida");
        }

        if (email == null || !email.contains("@")) {
            errores.put("email","El correo es requerido y debe ser válido");
        }

        if (country == null || country.isBlank()) {
            errores.put("country","El país es requerido");
        }

        if (jordan == null || jordan.length == 0) {
            errores.put("jordan","Debes seleccionar al menos una silueta");
        }


        if (errores.isEmpty()) {
            try (PrintWriter out = resp.getWriter()) {


                out.println("<!DOCTYPE html>");
                out.println("   <head>");
                out.println("       <meta charset=\"UTF-8\">");
                out.println("       <title>Title</title>");
                out.println("   </head>");
                out.println("   <body>");
                out.println("       <ul>");
                out.println("           <li>Nombre de usuario:" + username + "</li>");
                out.println("           <li>Contraseña:" + password + "</li>");
                out.println("           <li>Correo:" + email + "</li>");
                out.println("           <li>País:" + country + "</li>");
                out.println("           <li>Siluetas favoritas: <ul>");

                Arrays.asList(jordan).forEach(j -> {
                    out.println("<li>" + j + "</li>");
                });

                out.println("           </ul></li>");
                out.println("       </ul>");
                out.println("   </body>");
                out.println("</html>");
            }
        } else {
            req.setAttribute("errores", errores);
            getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
        }
    }
}
