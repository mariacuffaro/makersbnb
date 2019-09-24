feature 'list a space' do
  scenario 'be able to list a space on makersbnb' do
    visit '/spaces'
    click_button 'list_space'
    fill_in 'name', with: 'Ed'
    fill_in 'description', with: 'City centre apartment'
    fill_in 'price_per_night', with: '£50'
    fill_in 'available_from', with: '12/12/2019'
    fill_in 'available_to', with: '30/02/2020'
    click_button 'list_space'
    expect(page).to  have_content('City centre apartment')
   end
  end
