Given(/^I already joined to the mailing list$/) do
  @mailing = FactoryGirl.create(:mailing)
end

Given(/^I'm in mailing confimation page$/) do
  visit mailing_path(@mailing)
end

When(/^I press "([^"]*)" link$/) do |link_text|
  click_link(link_text)
end

Then(/^I should be redirected to Linkedin authorization page$/) do
  expect(URI(current_url).host).to eq('www.linkedin.com')
end
