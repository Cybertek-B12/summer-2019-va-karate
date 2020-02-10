Feature: query params test with omdb

  @run
  Scenario: pass single parameter
    Given url 'http://www.omdbapi.com/'
    * param apikey = 'a9faab96'
    When method get
    Then status 200