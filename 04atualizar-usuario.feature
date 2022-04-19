Feature: Atualizar um usuário
    Como uma pessoa qualquer
    Desejo atualizar as informações de determinado usuário
    Para ter o registro de suas informações atualizadas

    Scenario: Deve ser atualizado o usuário
        Given url baseUrl
        And path "users/1a9e2197-a43b-44bf-acec-e114248ec647"
        And request {name: "Mateuss", email: "landim.b@gmail.com"}
        When method put
        Then status 200
        And match response contains {id: "#string", name: "Mateuss", email: "landim.b@gmail.com", createdAt: "#string", updatedAt: "#string"}

    