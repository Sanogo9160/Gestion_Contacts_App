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
            
            /* Style pour l'en-tête */
            .header {
                 background-color: #f9fafb; /* Arrière-plan clair pour contraster avec le corps du tableau */
                 color: #374151; /* Couleur de texte sombre pour contraster avec l'arrière-plan */
                 font-size: 14px; /* Taille de police augmentée pour plus de visibilité */
                 font-weight: bold; /* Police gras pour souligner les titres */
                 border-bottom: 2px solid #d1d5db; /* Bordure inférieure pour séparer l'en-tête du corps */
                 box-shadow: 0 -2px 2px rgba(0, 0, 0, 0.05); /* Ombre douce pour donner un effet de profondeur */
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
<body class="bg-gray-100 flex flex-col justify-center items-start min-h-screen px-4 sm:px-6 lg:px-8">
    <div class="max-w-7xl w-full">
     <div class="bg-white shadow-lg rounded-lg p-6 mb-8">
    

    <div class="mb-4 flex justify-between">
        <!-- Premier bouton -->
        <a href="ajoutContact.jsp" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
           <i class="fas fa-plus mr-2"></i> Ajouter un nouveau Contact Apprenant
        </a>

        <!-- Deuxième bouton (retour à index.jsp) positionné à droite -->
        <a href="index.jsp" class="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded">
            <i class="fas fa-home"></i> Retour à l'Acceuil
        </a>
    </div>
        
        <!-- Section de la liste des contacts -->
        <div class="bg-white shadow-lg rounded-lg p-6">
            <h2 class="text-2xl font-bold mb-4">Liste des contacts ajoutés</h2>
            <table class="min-w-full bg-white shadow-md rounded-lg overflow-hidden">
        <thead>
            <tr>
                <th class="px-6 py-3 header"><i class="fas fa-user"></i> Nom</th>
                <th class="px-6 py-3 header"><i class="fas fa-briefcase"></i> Compétence</th>
                <th class="px-6 py-3 header"><i class="fas fa-envelope"></i> Email</th>
                <th class="px-6 py-3 header"><i class="fas fa-phone"></i> Téléphone</th>
                <th class="px-6 py-3 header"> <i class="fas fa-skull"></i> Actions</th>
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
                            
                            <!--button class="text-blue-600 hover:text-blue-900 edit" onclick="editContact(${status.index})">
                                <i class="fas fa-edit"></i>
                            </button -->
                            
                            <a href="ajoutContact.jsp?index=${status.index}" class="text-blue-600 hover:text-blue-900 edit">
                            <i class="fas fa-edit"></i>
                            </a>
                            
                                
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
