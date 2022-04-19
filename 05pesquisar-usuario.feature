Feature: Buscar Usuário
Como uma pessoa qualquer
Desejo pesquisar usuário por nome ou e-mail
Para ser capaz de encontrar um usuário cadastrado facilmente

    Scenario: Pesquisar usuário por nome ou email
        * def userName = "landim" + java.util.UUID.randomUUID()
        * def userEmail = java.util.UUID.randomUUID() + "@hotmail.com"
        * def payload = read("payloadUser.json")
        
        Given url baseUrl
        And path "search" 
        When method get
        Then status 200
        And match response contains {id: "#string", name: "#string", email: "#string", createdAt: "#string", updatedAt: "#string"}
