Then(/^I should be redirected to Facebook authorization page$/) do
  expect(URI(current_url).host).to eq('www.facebook.com')
end
