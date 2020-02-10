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

  @run




