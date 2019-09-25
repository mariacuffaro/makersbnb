feature 'login' do
  scenario ' a user can login' do
    # User.create(email: 'test@example.com', password: 'password123', first_name: 'Jim', last_name: 'Beam')

    visit('/')
    fill_in 'first_name', with: 'Tom'
    fill_in 'last_name', with: 'Jones'
    fill_in 'email', with: 'test@gmail.com'
    fill_in 'password', with: 'abc123'
    click_button 'Signup'

    visit('/login')
    fill_in 'email', with: 'test@gmail.com'
    fill_in 'password', with: 'abc123'
    click_button 'login'
    expect(page).to have_content("Book a Space")
  end
  scenario' login fails if password incorrect' do
    # User.create(email: 'test@example.com', password: 'password123', first_name: 'Jim', last_name: 'Beam')

    visit('/')
    fill_in 'first_name', with: 'Tom'
    fill_in 'last_name', with: 'Jones'
    fill_in 'email', with: 'test@gmail.com'
    fill_in 'password', with: 'abc123'
    click_button 'Signup'

    visit('/login')
    fill_in 'email', with: 'test@gmail.com'
    fill_in 'password', with: 'abc1234'
    click_button 'login'
    expect(page).to have_content("Credentials Incorrect")
  end
end
