def create_listing
  visit '/spaces'
  click_button 'list_space'
  fill_in 'name', with: 'Ed'
  fill_in 'description', with: 'City centre apartment'
  fill_in 'price_per_night', with: '£50'
  fill_in 'available_from', with: '10/11/2019'
  fill_in 'available_to', with: '30/01/2020'
  click_button 'list_space'
end

def create_another_listing
  visit '/spaces'
  click_button 'list_space'
  fill_in 'name', with: 'Eithel'
  fill_in 'description', with: 'Cosy country cottege'
  fill_in 'price_per_night', with: '£70'
  fill_in 'available_from', with: '10/11/2019'
  fill_in 'available_to', with: '30/01/2020'
  click_button 'list_space'
end
