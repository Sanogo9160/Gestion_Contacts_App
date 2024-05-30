<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Contacts</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
        <style>
            body { 
                font-family: Arial, sans-serif; 
                background-color: #f5f5f5; 
                margin: 0; 
                padding: 0; 
                display: flex; 
                justify-content: center; 
                align-items: center; 
                height: 100vh; 
            }
            .container {
                display: flex; 
                max-width: 1200px; 
                background-color: #fff; 
                border-radius: 8px; 
                box-shadow: 0 0 10px rgba(0,0,0,0.1); 
                padding: 20px; 
                box-sizing: border-box; 
            }
            .form-container, .list-container {
                flex: 1;
                margin: 10px;
            }
            .form-container input[type="text"],
            .form-container input[type="email"],
            .form-container input[type="tel"] {
                width: 100%;
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
            }
            .form-container button {
                background-color: #007bff;
                color: #fff;
                border: none;
                padding: 10px 20px;
                cursor: pointer;
                border-radius: 5px;
                width: 100%;
                margin-top: 10px;
            }
            .form-container button:hover {
                background-color: #0056b3;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }
            th, td {
                padding: 8px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }
            table td {
                color: black; /* Définition de la couleur du texte en noir */
            }
            th {
                background-color: #f2f2f2;
            }
            .edit, .delete {
                padding: 6px 10px;
                margin-right: 5px;
                border-radius: 5px;
                cursor: pointer;
            }
            .edit:hover, .delete:hover {
                background-color: #ddd;
            }
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

        <!-- Section de la liste des contacts -->
        <div class="bg-white shadow-lg rounded-lg p-6">
            <h2 class="text-2xl font-bold mb-4">Liste des contacts ajoutés</h2>
            <table class="min-w-full bg-white shadow-md rounded-lg overflow-hidden">
                <thead>
                    <tr>
                        <th class="px-6 py-3 bg-gray-50 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Nom</th>
                        <th class="px-6 py-3 bg-gray-50 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Compétence</th>
                        <th class="px-6 py-3 bg-gray-50 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Email</th>
                        <th class="px-6 py-3 bg-gray-50 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Téléphone</th>
                        <th class="px-6 py-3 bg-gray-50 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Actions</th>
                    </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200">
                    <c:forEach var="contact" items="${contacts}" varStatus="status">
                        <tr>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">${contact.name}</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">${contact.skill}</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">${contact.email}</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">${contact.phone}</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                <button class="text-blue-600 hover:text-blue-900 edit" onclick="editContact(${status.index})">
                                    <i class="fas fa-edit"></i>
                                </button>
                                <form action="contacts" method="post" style="display:inline;">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="index" value="${status.index}">
                                    <button type="submit" class="text-red-600 hover:text-red-900 delete ml-2">
                                        <i class="fas fa-trash-alt"></i>
                                    </button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        
        <!-- Bouton de retour à index.jsp -->
        <div class="text-center mt-4">
            <a href="index.jsp" class="inline-block bg-gray-500 text-white px-4 py-2 rounded-md hover:bg-gray-700 transition duration-300">
                <i class="fas fa-home"></i>
            </a>
        </div>
        
    </div>
                    
    <script>
        function editContact(index) {
            var row = document.querySelector('table').rows[index + 1]; // +1 pour l'entête
            var name = row.cells[0].textContent;
            var skill = row.cells[1].textContent;
            var email = row.cells[2].textContent;
            var phone = row.cells[3].textContent;

            document.getElementById('name').value = name;
            document.getElementById('email').value = email;
            document.getElementById('phone').value = phone;
            document.getElementById('skill').value = skill;

            document.getElementById('action').value = 'edit';
            document.getElementById('index').value = index;

            var submitButton = document.getElementById('submitButton');
            submitButton.innerHTML = '<i class="fas fa-edit mr-2"></i> Mettre à jour';
        }
    </script>
</body>

</html>
