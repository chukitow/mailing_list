Then(/^I should be redirected to Twitter authorization page$/) do
  expect(current_path).to eq('/auth/twitter')
end
