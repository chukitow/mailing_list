Feature: Linkedin connection
  In order to connect with my linkedin
  Visitor
  Should press linkedin connection in mailing confirmation

Scenario: Connect with linkedin
  Given I already joined to the mailing list
  And   I'm in mailing confimation page
  When  I press "Connect to LinkedIn" link
  Then  I should be redirected to Linkedin authorization page
