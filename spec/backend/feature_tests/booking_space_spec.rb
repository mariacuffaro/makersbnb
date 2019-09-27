require_relative './listing_helper.rb'

feature 'displaying selected space' do
  scenario 'show more detailed description of property' do
    create_listing
    click_on 'Stylish'
    expect(page).to have_content("City centre apartment")
  end

  scenario 'request booking using dates entered' do
    create_another_listing
    # save_and_open_page
    click_on 'Homely'
    fill_in 'start_date', with: '20-11-2019'
    fill_in 'end_date', with: '25-11-2019'
    click_button 'request_booking'
    expect(page).to have_content "Requests I've made"
    expect(page).to have_content "Not confirmed"
    expect(page).to have_content "Stylish"
   end
end
