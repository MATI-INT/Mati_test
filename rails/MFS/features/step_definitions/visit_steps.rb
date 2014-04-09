Given /^I am on the main page$/ do
  visit root_url
end

And /^I should not be able to visit admin users page$/ do
  visit users_url
  page.current_url.should == root_url + '404'
end

When /^I should be able to visit admin users page$/ do
  visit users_url
  page.current_url.should == users_url
end

And /^I visit admin users page$/ do
  visit users_path
end

And /^I visit "New review" page$/ do
  visit new_review_path
end