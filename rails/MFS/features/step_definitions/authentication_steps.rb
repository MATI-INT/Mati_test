Then /^I should see authentication button$/ do
  #CSS
  #XPath
  page.find(:xpath, '//div[@class="hero-unit"]/a').should have_content('Authenticate via Twitter to start')
end

Then /^I should see Post review button$/ do
  #CSS
  #XPath
  page.find(:xpath, '//div[@class="hero-unit"]/a').should have_content('Create new review')
end

Given /^I am authenticated$/ do
  user = FactoryGirl.create(:user)

  page.set_rack_session(mfs_user: user.id)
end

Given /^I am admin$/ do
  user = FactoryGirl.create(:admin)

  page.set_rack_session(mfs_user: user.id)
end