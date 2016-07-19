Feature: Mailing
  In order to join to the mailing list
  Visitor
  Should sends their information by mailing form

Scenario: Join mailing list
  Given I am on the landing page
  And I fill in "Full name" with "John"
  And I fill in "Email address" with "john@mail.me"
  When I press "Join"
  Then page should have notice message "Thanks! John"
