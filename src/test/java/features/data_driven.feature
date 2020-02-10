Feature: data driven tests

  @run
  Scenario Outline: test state names <zip>
    Given url 'http://api.zippopotam.us/us/<zip>'
    When method get
    Then match response.places[0].state == '<state>'

    Examples:
      | zip   | state                |
      | 22031 | Virginia             |
      | 20001 | District of Columbia |
      | 94043 | California           |