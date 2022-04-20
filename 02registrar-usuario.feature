Feature: Registrar usuário
Como uma pessoa qualquer
Desejo registrar informações de usuário
Para poder manipular estas informações livremente

    Background:
        Given url baseUrl
        And path "users"
    
        Scenario: Deve ser possivel cadastrar um usuário
            * def userName = "landim ribeiro" + java.util.UUID.randomUUID()
            * def userEmail = java.util.UUID.randomUUID() + "@hotmail.com"
            * def payload = read("payloadUser.json")
            
            And request payload
            When method post
            Then status 201
            And match response contains {name: "#(userName)", email: "#(userEmail)"}  
        
     
        Scenario: Cadastrar usuário com email inválido
            And request {name: "Mateuss", email: "landim.bgmailcom"}  
            When method post  
            Then status 400
    # Email foi feito sem o "@" e sem o ".com" e o teste retornou status 400, como foi esperado e validando o critério
    
        Scenario: Registrar usuário com email que já existe
            * def userName = "mateus landim" + java.util.UUID.randomUUID()
            * def userEmail = java.util.UUID.randomUUID() + "@gmail.com"
            * def payload = read("payloadUser.json")

            And request payload
            When method post
            Then status 201
            And path "users"
            And request payload
            When method post
            Then status 422
            And match response contains {error: "User already exists."}
     
        Scenario: Cadastrar um nome de usuário com mais de 100 caracteres
            And request {name: "brunomateubrunomateubrunomateubrunomateubrunomateubrunomateubrunomateubrunomateubrunomateubrunomateus", email: "landim.b@gmail.com"}  
            When method post 
            Then status 400 
        
        Scenario: Cadastrar um email de usuário com mais de 60 caracteres 
            And request {name: "Mateuss", email: "brunobrunobrunobrunobrunobrunobrunobrunobrunobrunos@gmail.com"} 
            When method post
            Then status 400
            

