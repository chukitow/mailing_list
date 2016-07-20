Feature: Login
  In order to access to dashboard
  Admin
  Should provide valid credentials

Scenario: Admin user login
  Given I already have an account
  And   I'm in the login page
  And   I fill fields with my credentials
  When  I press "Login"
  Then  I should be redirected to dashboard page

Scenario: Admin user logout
  Given I'm logged in
  When  I press "Log out" link
  Then I should be redirected to login page

