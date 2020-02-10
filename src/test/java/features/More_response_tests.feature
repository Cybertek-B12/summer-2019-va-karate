Feature: Jsonplaceholder api testing

  Background:
    * url 'https://jsonplaceholder.typicode.com'


  Scenario: verify values in response
    Given path "albums/1"
    When method get
    Then status 200
    * match response.id == 1

#    @run
  Scenario: array of objects
    Given path "albums"
    When method get
    Then status 200
    * print response[0]
    * print response[0].userId
    * print response[0].id
    * print response[0].title


   Scenario: verify whole response
     Given path "albums/1"
     When method get
     Then status 200
     * match response == {"userId": 1,"id": 1,"title": "quidem molestiae enim"}



  Scenario: verify whole response
    Given path "albums/1"
    When method get
    Then status 200
    * match response ==
    """
    {
     "userId": 1,
     "id": 1,
     "title": "quidem molestiae enim"
    }
    """

  Scenario: fuzzy matching value types
    Given path "albums/1"
    When method get
    Then status 200
    * match response == {"userId": '#number',"id": '#number',"title": '#string'}


    Scenario: fuzzy matching value types
      Given path "albums/1"
      When method get
      Then status 200
      * match response.firstname == '#notpresent'
      * match response.title == '#present'
      * match response.title == '#notnull'
      * match response.title == '#string'

     Scenario: verify values inside response
        Given path "albums/1"
        When method get
        Then status 200
        * match response contains {"id": 1}
        * match response contains {"title": '#string'}

   Scenario: verify length of a response array
       Given path "albums"
       When method get
       Then status 200
       * assert response.length == 100

