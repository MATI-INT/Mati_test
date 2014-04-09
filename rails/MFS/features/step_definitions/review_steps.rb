Then /^I should see test review on the main page$/ do
  page.should have_content('Test review')
  page.should have_content('My first review')
end