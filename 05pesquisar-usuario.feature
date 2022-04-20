Feature: Buscar Usuário
Como uma pessoa qualquer
Desejo pesquisar usuário por nome ou e-mail
Para ser capaz de encontrar um usuário cadastrado facilmente

    Scenario: Buscar Usuário
        * def userName = "john mayer" + java.util.UUID.randomUUID()
        * def userEmail = java.util.UUID.randomUUID() + "@gmail.com"
        * def payload = read("payloadUser.json")

        Given url baseUrl
        And path "search"
        And request payload
        When method get
        Then status 200
        And match response == "#array"
