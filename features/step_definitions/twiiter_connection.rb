Then(/^I should be redirected to Twitter authorization page$/) do
  expect(URI(current_url).host).to eq('api.twitter.com')
end
