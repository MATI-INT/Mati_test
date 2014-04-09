When /^I fill and submit the review form$/ do
  within '#new_review' do
    fill_in 'Title', with: 'Test review'
    fill_in 'Body', with: 'My first review'
    click_button 'Create'
  end
end