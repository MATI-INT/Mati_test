Given /^there is a user$/ do
  FactoryGirl.create(:user)
end

When /^I grant the user admin rights$/ do
  page.find(
      :xpath,
      '//ul[@id="users-list"]/li[2]/a[@class="change_role"]').click



  page.find(
      :xpath,
            '//ul[@id="users-list"]/li[2]/a[@class="change_role"]'
  ).should have_content("Remove admin rights")
end