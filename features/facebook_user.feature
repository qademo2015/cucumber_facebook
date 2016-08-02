@test_user
Feature: Create and delete new test facebook user

#  Keeping this scenario as example only since we moved it into nested steps in
#  common_steps.rb
#  Scenario: As facebook developer, I'm creating a new test facebook user
#    Given a request is made to "/{client_id}/accounts/test-users"
#    When these parameters are supplied in URL:
#      |installed       | true              |
#      |access_token    |                   |
#    And I make test Facebook user1


  Scenario: As facebook developer, I can change name of test user
    Given I create test user1 with permissions:
    Given a request is made to "/{user1}"
    When these parameters are supplied in URL:
      |name                | Lucy              |
      |user_access_token   |                   |
    Then the POST api call should succeed

    Given a request is made to "/{user1}"
    When these parameters are supplied in URL:
      |user_access_token   |                   |
    Then the GET api call should succeed
    And these response keys should have value:
      | name | Lucy|

