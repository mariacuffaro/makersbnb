feature 'login' do
  it ' a user can login' do
    User.create(email: 'test@example.com', password: 'password123', first_name: 'Jim', last_name: 'Beam')
    visit '/login'
    fill_in 'email', with:'test@example.com'
    fill_in 'password', with:'password123'
    click_button('login')
    expect(page).to have_content("I'm here")
  end
end
