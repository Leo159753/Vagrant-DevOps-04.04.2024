<?php
// Dados de conexão ao banco de dados
$servername = "x.x.x.x"; // ou o endereço IP do servidor MySQL
$username = "leo2"; // Usuario do Banco de Dados
$password = "teste"; // Senha do Usuario do Banco de Dados
$dbname = "dados"; // Nome Banco de Dados

// Conexão com o banco de dados
$conn = new mysqli($servername, $username, $password, $dbname);

// Verifica se a conexão foi estabelecida corretamente
if ($conn->connect_error) {
    die("Falha na conexão: " . $conn->connect_error);
} else {
    echo "Conexão bem-sucedida!";
}
?>