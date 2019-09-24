require './spec/spec_helper.rb'

  feature 'loads the index page' do
    scenario 'navigates to hamepage' do
      visit('/')
      expect(page).to have_content('Hello Makers')
    end
  end
