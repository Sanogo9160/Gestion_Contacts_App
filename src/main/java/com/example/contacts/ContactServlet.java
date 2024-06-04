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
    
    // Traitement des données
    private final List<Contact> contacts = new ArrayList<>();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        int index = 0;
        try {
            index = Integer.parseInt(request.getParameter("index"));
        } catch (NumberFormatException e) {
            // Gestion de l'erreur si l'index n'est pas fourni
        }

        if ("edit".equals(action)) {
            if (index >= 0 && index < contacts.size()) {
                Contact contact = contacts.get(index);
                request.setAttribute("contact", contact);
                request.getRequestDispatcher("/ajoutContact.jsp").forward(request, response);
            } else {
                // Redirection vers la page principale si l'index n'est pas valide
                response.sendRedirect("contacts");
            }
        } else {
            request.setAttribute("contacts", contacts);
            request.getRequestDispatcher("/contacts.jsp").forward(request, response);
        }
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

            if (name!= null && email!= null && phone!= null && skill!= null) {
                // Action d'ajout
                contacts.add(new Contact(name, email, phone, skill));
            }
        } else if ("edit".equals(action)) {
            int index = Integer.parseInt(request.getParameter("index"));
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String skill = request.getParameter("skill");

            if (index >= 0 && index < contacts.size() && name!= null && email!= null && phone!= null && skill!= null) {
                Contact contact = contacts.get(index);
                contact.setName(name);
                contact.setEmail(email);
                contact.setPhone(phone);
                contact.setSkill(skill);
            }
        } else if ("delete".equals(action)) {
            int index = Integer.parseInt(request.getParameter("index"));
            if (index >= 0 && index < contacts.size()) {
                contacts.remove(index);
            }
        }

        // Redirection vers la page principale après traitement
        response.sendRedirect("contacts");
    }
}
