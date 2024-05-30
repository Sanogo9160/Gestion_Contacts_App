<%-- 
    Document   : index.jsp
    Created on : 28 mai 2024, 08:54:49
    Author     : mahrokiatou.sanogo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Contacts App</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #e9ecef;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            text-align: center;
            background-color: #ffffff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }
        .container:hover {
            transform: translateY(-5px);
        }
        h1 {
            font-size: 26px;
            color: #343a40;
            animation: fadeIn 3s infinite;
        }
        @keyframes fadeIn {
            0% { opacity: 0; }
            50% { opacity: 1; }
            100% { opacity: 0; }
        }
        a {
            display: inline-block;
            margin-top: 20px;
            padding: 12px 24px;
            color: #ffffff;
            background-color: #007bff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        a:hover {
            background-color: #0056b3;
        }
        .logo {
            margin-top: 20px;
            max-width: 150px;
            border-radius: 50%;
        }
    </style>
</head>
<body>
    <div class="container">
        <img class="logo" src="Head.jpg" alt="Gestion des contacts">
        <h1>Bienvenue sur mon application de gestion des contacts</h1>
        <a href="contacts.jsp">Voir Contacts</a>
    </div>
</body>
</html>
