require_relative './listing_helper.rb'

feature 'displaying selected space for chosen dates' do
  scenario 'show more detailed description of property' do
     create_listing
    visit '/spaces/id1'
    expect(page).to have_content("City centre apartment")
   end
end

# feature 'displaying selected space for chosen dates' do
#   it 'be able to request a booking' do
#     visit '/spaces/id'
#     expect(page).to
#   end
# end
