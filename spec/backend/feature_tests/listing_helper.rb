def create_listing
  signup
  login
  click_button 'list_space'
  fill_in 'name', with: 'Stylish'
  fill_in 'description', with: 'City centre apartment'
  fill_in 'price_per_night', with: '£50'
  fill_in 'available_from', with: '01/11/2019'
  fill_in 'available_to', with: '01/12/2019'
  click_button 'list_space'
end

def create_another_listing
  signup
  login
  click_button 'list_space'
  fill_in 'name', with: 'Homely'
  fill_in 'description', with: 'Cosy country cottege'
  fill_in 'price_per_night', with: '£70'
  fill_in 'available_from', with: '10/11/2019'
  fill_in 'available_to', with: '30/01/2020'
  click_button 'list_space'
end

def signup
 visit('/')
 fill_in 'first_name', with: 'Tom'
 fill_in 'last_name', with: 'Jones'
 fill_in 'email', with: 'test@gmail.com'
 fill_in 'password', with: 'abc123'
 click_button 'Signup'
end

def login
 fill_in 'email', with: 'test@gmail.com'
 fill_in 'password', with: 'abc123'
 click_button 'login'
end
