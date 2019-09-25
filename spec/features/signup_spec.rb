require './spec/spec_helper.rb'

feature 'Sign up' do
  scenario 'sign up as a user' do
    visit('/')
    fill_in 'first_name', with: 'Tom'
    fill_in 'last_name', with: 'Jones'
    fill_in 'email', with: 'test@gmail.com'
    fill_in 'password', with: 'abc123'
    click_button 'Signup'
    expect(page).to have_content('Log in to Makersbnb')
  end
end
  # 
  # feature 'form submits to new profile page' do
  #   scenario 'user fills in the form and clicks submit' do
  #     visit('/')
  #     click_button 'Signup'
  #     expect(page).to have_content 'successfully signed up'
  #   end
  # end
