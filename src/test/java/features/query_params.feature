Feature: query params test with omdb

  Scenario: pass single parameter
    Given url 'http://www.omdbapi.com/'
    * param apikey = 'a9faab96'
    When method get
    Then status 200


  Scenario: pass multiple query parameters
    Given url 'http://www.omdbapi.com/'
    * param apikey = 'a9faab96'
    * param t = 'Terminator'
    * param y = 1984
    When method get
    Then status 200
    * match response contains {"Year": '1984'}

  Scenario: all params in same line
    Given url 'http://www.omdbapi.com/'
    * params { apikey:'a9faab96', t:'Terminator', y:1984 }
    When method get
    Then status 200
    * match response contains {"Year": '1984'}


  Scenario: all params in same line
    Given url 'http://www.omdbapi.com/'
    * params { apikey:'a9faab96', t:'Terminator', y:1984 }
    When method get
    Then status 200
    * match response.Title == 'The Terminator'
    * match response.Year != '1991'
    * match response !contains {"Year": '1991'}

  Scenario: create a user and then get it by id
    * def user =
    """
    {
      "name": "Test User",
      "username": "testuser",
      "email": "test@user.com",
      "address": {
        "street": "Has No Name",
        "suite": "Apt. 123",
        "city": "Electri",
        "zipcode": "54321-6789"
      }
    }
    """
    Given url 'https://jsonplaceholder.typicode.com/users'
    And request user
    When method post
    Then status 201
    * def id = response.id
    * print 'created id is: ', id
    ##### another request
    Given path id
    When method get
    Then status 200
    And match response contains user
