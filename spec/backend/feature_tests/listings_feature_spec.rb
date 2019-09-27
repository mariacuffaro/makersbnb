require_relative './listing_helper.rb'

feature 'list a space' do
  scenario 'be able to list a space on makersbnb' do
    create_listing
    # save_and_open_page
    expect(page).to  have_content('City centre apartment')
   end
end

feature 'allows to list spaces only for users who are logged in' do
 scenario 'a user who is not logged in, can not list spaces' do
   visit ('/spaces')
   click_button 'list_space'
   expect(page).to have_content('Log in to Makersbnb')
 end
end

feature 'display listings' do
  scenario 'in reverse chronological order' do
    create_listing
    create_another_listing
    index_of_first_listing = page.body.index('City centre apartment')
    index_of_second_listing = page.body.index('Cosy country cottege')
    expect(index_of_second_listing).to be < index_of_first_listing
   end

   scenario 'that are available during the selected range' do
     create_listing
     create_another_listing
     fill_in 'start_date', with: '02/12/2019'
     fill_in 'end_date', with: '10/12/2019'
     click_button 'list_spaces'
     expect(page).to have_content('Cosy country cottege')
     expect(page).to_not have_content('City centre apartment')
   end
end
