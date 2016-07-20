Given(/^I already have an account$/) do
  @user = FactoryGirl.create(:user, password: '12345678')
end

Given(/^I'm in the login page$/) do
  visit login_path
end

Given(/^I fill fields with my credentials$/) do
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: '12345678'
end

Then(/^I should be redirected to dashboard page$/) do
  expect(current_path).to eq('/dashboard')
end

Given(/^I'm logged in$/) do
  @user = FactoryGirl.create(:user, password: '12345678')

  visit login_path

  fill_in 'Email', with: @user.email
  fill_in 'Password', with: '12345678'

  click_button('Login')
end

Then(/^I should be redirected to login page$/) do
  expect(current_path).to eq('/login')
end
