Feature: login to bookit

#  How to get all student in bookit app?
#
#  Get access token by calling sign
#  username=teacherva5@gmail.com
#  password= maxpayne
#  Extract the token response
#  Call /api/students
#  Header—>    Authorization:token
#  Verify 200

  @run
  Scenario:
    # GET TOKEN
    Given url 'https://cybertek-reservation-api-qa.herokuapp.com'
    * path "sign"
    * param email = 'teacherva5@gmail.com'
    * param password = 'maxpayne'
    When method get
    Then status 200
    * def token = response.accessToken
    * print "TOKEN: " + token
    # GET ALL STUDENT USING THE TOKEN
    Given path "api/students"
    * header Authorization = token
    When method get
    Then status 200
    * print response.length