Feature: Encontrar um usuário por ID
    Como uma pessoa qualquer
    Desejo consultar os dados de um usuário
    Para visualizar as informações deste usuário

    Scenario: Buscar usuário por ID
        * def userName = "Mateus Abacate" + java.util.UUID.randomUUID()
        * def userEmail = java.util.UUID.randomUUID() + "@gmail.com"
        * def payload = read("payloadUser.json")
        Given url baseUrl
        And path "users"
        And request payload
        When method post
        Then status 201
        * def idResponse = response.id 
        
        #Buscar usuário criado
        Given url baseUrl
        And path "users", idResponse
        When method get
        Then status 200

    Scenario: Usuário não localizado      
        Given url baseUrl
        And path "users", java.util.UUID.randomUUID()
        When method get
        Then status 404
        