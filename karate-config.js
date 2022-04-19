function setup() {
    var config = {
        baseUrl: "https://crud-api-academy.herokuapp.com/api/v1"
    }
    
    karate.configure("logPrettyRequest", true);
    karate.configure("logPrettyResponse", true);

    return config;
}