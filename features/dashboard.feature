Feature: Dashboard
  Admin
  Should are capable to see mailing information

Scenario: Dashboard mailing table
  Given The following mailing is in the database:
    | name           | email                    |
    | Ivan Velasquez | ivan.velasquez@gmail.com |
  And   I'm logged in
  Then  I should see "Ivan Velasquez" in the table

Scenario: Dashboard mailing information
  Given There is a mailing in the databse
  And   I'm logged in
  When  I press "Show info" link
  Then  I should see mailing information
