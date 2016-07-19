Feature: Twitter connection
  In order to connect with my twitter
  Visitor
  Should press twitter connection in mailing confirmation

Scenario: Connect with linkedin
  Given I already joined to the mailing list
  And   I'm in mailing confimation page
  When  I press "Connect to twitter" link
  Then  I should be redirected to Twitter authorization page
