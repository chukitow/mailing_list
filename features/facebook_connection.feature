Feature: Facebook connection
  In order to connect with my facebook
  Visitor
  Should press facebook connection in mailing confirmation

Scenario: Connect with facebook
  Given I already joined to the mailing list
  And   I'm in mailing confimation page
  When  I press "Connect to Facebook" link
  Then  I should be redirected to Facebook authorization page
