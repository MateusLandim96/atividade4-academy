Feature: Hook

    @criarUsuario
    Scenario: Registra um novo usuário
       Given url baseUrl
       And path "users"
        And request {name: "Mateus", email: "maateuuus@hotmail.com"}    
        When method post
        Then status 201

    @deletarUsuario
    Scenario: deletar um novo usuario
       Given url baseUrl 
        And path "users", payload
        When method delete
        Then status 204    