Feature: Encontrar um usuário por ID
    Como uma pessoa qualquer
    Desejo consultar os dados de um usuário
    Para visualizar as informações deste usuário

    Scenario: Encontrar usuário por id
        Given url baseUrl
        And path "users/"
        When method get
        Then status 200
        And match response contains {id: "#string", name: "Mateuss", email: "landim.b@gmail.com", createdAt: "#string", updatedAt: "#string"}

    Scenario: Encontrar usuário por id inválido
        Given url baseUrl
        And path "users/1a9e2197-a43b-44bf-acec-e114248ec647"    
        