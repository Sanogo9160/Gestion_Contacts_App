package com.example.contacts;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/contacts")
public class ContactServlet extends HttpServlet {
    private final List<Contact> contacts = new ArrayList<>();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("contacts", contacts);
        request.getRequestDispatcher("/contacts.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if ("add".equals(action)) {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String skill = request.getParameter("skill");

            if (name != null && email != null && phone != null && skill != null) {
                //Action d'ajout 
                contacts.add(new Contact(name, email, phone, skill));
            }
        } else if ("edit".equals(action)) {
            int index = Integer.parseInt(request.getParameter("index"));
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String skill = request.getParameter("skill");

            if (index >= 0 && index < contacts.size() && name != null && email != null && phone != null && skill != null) {
                Contact contact = contacts.get(index);
                contact.setName(name);
                contact.setEmail(email);
                contact.setPhone(phone);
                contact.setSkill(skill);
            } 
            //  Cette action modifie un contact existant
            
        } else if ("delete".equals(action)) {
            int index = Integer.parseInt(request.getParameter("index"));
            if (index >= 0 && index < contacts.size()) {
                contacts.remove(index);
            }
        }
        //Pour supprimer un contact existant 

        response.sendRedirect("contacts");
    }
}

