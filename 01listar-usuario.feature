Feature: Lista de usuários
    Como uma pessoa qualquer
    Desejo consultar todos os usuários cadastrados
    Para ter as informações de todos os usuários

    Scenario: Listar usuários cadastrados 
        * def abacate = call read("hook.feature")
        Given url baseUrl
        And path "users"
        When method get
        Then status 200
        And match response == "#array"
        
        
        
        