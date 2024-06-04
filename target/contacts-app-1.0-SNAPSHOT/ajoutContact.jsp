<%-- 
    Document   : ajoutContact.jsp
    Created on : 27 mai 2024, 15:07:53
    Author     : mahrokiatou.sanogo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Ajouter ou mettre à jour un contact</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
        <style>
            
        
        </style>
    </head>
        <body class="bg-gray-100 flex justify-center items-center min-h-screen">
    <div class="container mx-auto p-6 bg-white shadow-lg rounded-lg space-y-10">
        
        <!-- Section du formulaire -->
        <div class="bg-white shadow-lg rounded-lg p-6">
            <h2 class="text-2xl font-bold mb-4">Ajouter ou mettre à jour un contact</h2>
            <form id="contactForm" action="contacts" method="post" class="space-y-4">
                <input type="hidden" id="action" name="action" value="add">
                <input type="hidden" id="index" name="index">
                <div>
                    <input type="text" id="name" name="name" placeholder="Nom" required class="w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                </div>
                <div>
                    <input type="email" id="email" name="email" placeholder="Email" required class="w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                </div>
                <div>
                    <input type="tel" id="phone" name="phone" placeholder="Numéro de téléphone" required class="w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                </div>
                <div>
                    <input type="text" id="skill" name="skill" placeholder="Compétence" required class="w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                </div>
                <div>
                    <button type="submit" id="submitButton" class="w-full bg-blue-500 text-white px-4 py-2 rounded-md hover:bg-blue-700 transition duration-300">
                        <i class="fas fa-plus mr-2"></i> Ajouter
                    </button>
                </div>
            </form>
        </div>
    </body>
</html>
