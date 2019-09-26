require_relative './listing_helper.rb'

feature 'list a space' do
  scenario 'be able to list a space on makersbnb' do
    create_listing
    # save_and_open_page
    expect(page).to  have_content('City centre apartment')
   end
end

feature 'display listings' do
  scenario 'in reverse chronological order' do
    create_listing
    create_another_listing
    # save_and_open_page
    index_of_first_listing = page.body.index('City centre apartment')
    index_of_second_listing = page.body.index('Cosy country cottege')
    expect(index_of_second_listing).to be < index_of_first_listing
   end

   scenarion 'that are available during the selected range' do
     
   end
end
