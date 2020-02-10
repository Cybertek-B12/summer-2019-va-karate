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

  @run

  Scenario: all params in same line
    Given url 'http://www.omdbapi.com/'
    * params { apikey:'a9faab96', t:'Terminator', y:1984 }
    When method get
    Then status 200
    * match response.Title == 'The Terminator'
    * match response.Year != '1991'
#    * match response not contains {"Year": '1991'}