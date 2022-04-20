Feature: Atualizar um usuário
    Como uma pessoa qualquer
    Desejo atualizar as informações de determinado usuário
    Para ter o registro de suas informações atualizadas

    Background: Atualizar Usuário Cadastrado 
        Given url baseUrl
        And path "users"
    
        * def userName = "ucrania" + java.util.UUID.randomUUID()
        * def userEmail = java.util.UUID.randomUUID() + "@uol.com"
        * def payload = read("payloadUser.json")
        
        And request payload
        When method post
        Then status 201
        * def idResponse = response.id 
        And path "users"

        Scenario: Atualizar por id
            * def userName = "ucrania" + java.util.UUID.randomUUID()
            * def userEmail = java.util.UUID.randomUUID() + "@gmail.com"
            * def payload = read("payloadUser.json")
            And path idResponse
            And request payload
            When method put
            Then status 200
            And match response == "#object"

        Scenario: Validar Usuário
            * def userName = "ucrania" + java.util.UUID.randomUUID()
            * def userEmail = java.util.UUID.randomUUID() + "gmail.com"
            * def payload = read("payloadUser.json")

            And path idResponse
            And request payload
            When method put
            Then status 400
            
        Scenario: Atualizar com email que já está em uso
            * def userName = "ucrania" + java.util.UUID.randomUUID()
            * def userEmail = java.util.UUID.randomUUID() + "@gmail.com"
            * def payload = read("payloadUser.json")

            And request payload
            When method post
            Then status 201

            Given path "users", idResponse
            And request payload
            When method put
            Then status 422
            And match response contains {error: "E-mail already in use."}

        Scenario: Não é possível atualizar o nome com mais de 100 caracteres
            * def userName = "brunobrunobrunobrunobrunobrunobrunobrunobrunobrunobrunobrunobrunobrunobrunobrunobrunobrunobrunobrunoo" + java.util.UUID.randomUUID()
            * def userEmail = java.util.UUID.randomUUID() + "@gmail.com"
            * def payload = read("payloadUser.json")

            And path idResponse
            And request payload
            When method put
            Then status 400

        Scenario: Não deve ser possível atualizar o email com mais de 60 caracteres
            * def userName = "ucrania" + java.util.UUID.randomUUID()
            * def userEmail = java.util.UUID.randomUUID() + "@gmail.com@gmail.com@gmail.com@gmail.com@gmail.com@gmail.com@gmail.com@gmail.com"
            * def payload = read("payloadUser.json")

            And path idResponse
            And request payload
            When method put
            Then status 400

    