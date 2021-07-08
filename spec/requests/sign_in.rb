describe 'the signin process', type: :feature do
  it 'signs @user in' do
    u = create(:user)
    visit '/users/sign_in'
    fill_in 'Email', with: u.email
    fill_in 'Password', with: u.password
    click_button 'Log in'
    expect(current_path).to eq(root_path)
    expect(page).to have_text('Signed in successfully.')
  end
end