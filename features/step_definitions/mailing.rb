Given(/^I am on the landing page$/) do
  visit root_path
end

Given(/^I fill in "([^"]*)" with "([^"]*)"$/) do |field, content|
  fill_in field, with: content
end

When(/^I press "([^"]*)"$/) do |text|
  click_button(text)
end

Then(/^page should have notice message "([^"]*)"$/) do |text|
  page.should have_content(text)
end
