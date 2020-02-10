Feature: Basic zippo tests


  # verify status and header
  Scenario: test status
    Given url 'http://api.zippopotam.us/us/22031'
    When method post
    Then status 200
    * match header Content-Type == 'application/json'

#  @run
  Scenario: send header
    Given url 'http://api.zippopotam.us/us/22031'
    * header Accept = "application/json"
    When method get
    Then status 200
    * match header Content-Type == 'application/json'

#  @run
  Scenario: printing and variables
    * print "hello world"
    * print "hello world", " one more time"
    * def name = "insert boss"
    * print name
    * print "hello" + name
    * print 1 + 1

  @run
  Scenario: verify response
    Given url 'http://api.zippopotam.us/us/22031'
    When method get
    Then print "PRINTING RESPONSE"
    Then print response
    * print response.country
    * match response.country == 'United States'