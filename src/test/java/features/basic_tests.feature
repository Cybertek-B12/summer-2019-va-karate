Feature: Basic zippo tests


  # verify status and header
  Scenario: test status
    Given url 'http://api.zippopotam.us/us/22031'
    When method post
    Then status 200
    * match header Content-Type == 'application/json'

  @run
  Scenario: send header
    Given url 'http://api.zippopotam.us/us/22031'
    * header Accept = "application/json"
    When method get
    Then status 200
    * match header Content-Type == 'application/json'