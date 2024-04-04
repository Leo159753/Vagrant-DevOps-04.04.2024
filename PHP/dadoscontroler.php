<?php
// Verifica se o formulário foi enviado
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Verifica se os campos do formulário foram preenchidos
    if (!empty($_POST['nome']) && !empty($_POST['idade']) && !empty($_POST['senha'])) {
        // Recupera os dados do formulário
        $nome = $_POST['nome'];
        $idade = $_POST['idade'];
        $senha = $_POST['senha'];

        // Aqui você pode adicionar a lógica para inserir os dados no banco de dados
        // Por exemplo, você pode usar a conexão ao banco de dados e executar uma instrução SQL para inserir os dados

        // Exemplo de conexão ao banco de dados (substitua com suas credenciais)
        $servername = "x.x.x.x";
        $username = "leo2";
        $password = "teste";
        $dbname = "dados";

        $conn = new mysqli($servername, $username, $password, $dbname);

        if ($conn->connect_error) {
            die("Falha na conexão: " . $conn->connect_error);
        }

        // Prepara e executa a consulta SQL para inserir os dados na tabela
        $sql = "INSERT INTO usuario (username, senha, idade) VALUES ('$nome', '$senha', '$idade')";

        if ($conn->query($sql) === TRUE) {
            echo "Dados adicionados com sucesso";
        } else {
            echo "Erro ao adicionar dados: " . $conn->error;
        }

        $conn->close();
    } else {
        echo "Por favor, preencha todos os campos do formulário.";
    }
    // Adicione uma mensagem de operação bem-sucedida
}
?>