Feature: Hook

    Scenario: Criar Usuário
        * def userName = "landim" + java.util.UUID.randomUUID()
        * def userEmail = java.util.UUID.randomUUID() + "@hotmail.com"
        * def payload = read("payloadUser.json")
    
        Given url baseUrl
        And path "users"
        And request payload
        When method post
        Then status 201