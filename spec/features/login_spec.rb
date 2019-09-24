feature 'login' do
  it ' a user can login' do
    User.create(email: 'test@example.com', password: 'password123')
    visit '/login'
    fill_in(email:'test@example.com')
    fill_in(password:'password123')
    click_button('Sign in')
    expect(page).to have_content('Welcome, test@example.com')
  end
end
