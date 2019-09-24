require './spec/spec_helper.rb'

  feature 'loads the index page with the form visible' do
    scenario 'navigates to hamepage' do
      visit('/')
      expect(page).to have_button('Signup')
    end
  end

  feature 'form submits to new profile page' do
    scenario 'user fills in the form and clicks submit' do
      visit('/')
      fill_in 'first_name', with: 'Neil'
      click_button 'Signup'
      expect(page).to have_content 'Hello Neil'
    end
  end
