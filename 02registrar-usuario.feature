Feature: Registrar usuário
Como uma pessoa qualquer
Desejo registrar informações de usuário
Para poder manipular estas informações livremente

    Background:
    * def payload = {name: "Mateus", email: "maateuuus@hotmail.com"}    
    Given url baseUrl
    And path "users"

     Scenario: Cadastrar Usuário
        When method post
        Then status 201
        And match response contains {id: "#(response.id)", name: "Mateus", email: "maateuuus@hotmail.com", createdAt: "#string", updatedAt: "#string"}
        * def userId = response.id
        * def deletar = call read("hook.feature@deletarUsuario")

    @ignore
    Scenario: Cadastrar usuário com email inválido
        And request {name: "Mateuss", email: "landim.bgmailcom"}  
        When method post  
        Then status 400
    # Email foi feito sem o "@" e sem o ".com" e o teste retornou status 400
     @ignore
    Scenario: Registrar usuário com email que já existe
        And request {name: "Mateuss", email: "landim.b@gmail.com"}
        When method post
        Then status 422
        And match response contains {error: "User already exists."}
     @ignore
    Scenario: Cadastrar um nome de usuário com mais de 100 caracteres
        And request {name: "brunomateubrunomateubrunomateubrunomateubrunomateubrunomateubrunomateubrunomateubrunomateubrunomateus", email: "landim.b@gmail.com"}  
        When method post 
        Then status 400 
     @ignore
    Scenario: Cadastrar um email de usuário com mais de 60 caracteres 
        And request {name: "Mateuss", email: "brunobrunobrunobrunobrunobrunobrunobrunobrunobrunos@gmail.com"} 
        When method post
        Then status 400

