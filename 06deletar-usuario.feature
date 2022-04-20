Feature: Deletar um usuário
Como uma pessoa qualquer
Desejo remover um usuário
Para que suas informações não estejam mais registradas

    Scenario: Deletar um usuário
        * def userName = "Mateeeus" + java.util.UUID.randomUUID()
        * def userEmail = java.util.UUID.randomUUID() + "@uol.com"
        * def payload = read("payloadUser.json")

        Given url baseUrl
        And path "users"
        And request payload
        When method post
        Then status 201
        * def idResponse = response.id 

        Given url baseUrl
        And path "users", idResponse
        When method delete
        Then status 204

    