require_relative './listing_helper.rb'

feature 'displaying selected space for chosen dates' do
  scenario 'show more detailed description of property' do
    create_listing
    click 'Stylish'
    expect(page).to have_content("City centre apartment")
  end
end
