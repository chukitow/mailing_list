Given(/^The following mailing is in the database:$/) do |table|
  table.hashes.each do |hash|
    FactoryGirl.create(:mailing, hash)
  end
end

Then(/^I should see "([^"]*)" in the table$/) do |name|
  find('tr', text: name).should have_content(name)
end

Given(/^There is a mailing in the databse$/) do
  @mailing = FactoryGirl.create(:mailing)
end

Then(/^I should see mailing information$/) do
  expect(current_path).to eq(dashboard_mailing_path(@mailing))
end
