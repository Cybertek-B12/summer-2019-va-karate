Feature: Basic zippo tests

  @run
  Scenario: test status
    Given url 'http://api.zippopotam.us/us/22031'
    When method post
    Then status 200
    * match header Content-Type == 'application/json'