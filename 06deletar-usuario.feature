Feature: Deletar um usuário
Como uma pessoa qualquer
Desejo remover um usuário
Para que suas informações não estejam mais registradas

    Scenario: Remover usuário
        * def abacate = call read("hook.feature@criarUsuario")
        * def payload = read("payloadUser.json")
        
        Given url baseUrl
        And path "users", abacate.response.id
        When method delete
        Then status 204