require 'rails_helper'

describe 'sign in' do
  let!(:user) { create(:user) }

  it 'signs the user in' do
    visit '/'

    within('#sign_in_form') do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'
    end

    expect(page).to have_text('Tasks')
  end

  it 'fails with wrong credentials' do
    visit '/'

    within('#sign_in_form') do
      fill_in 'Email', with: 'wrong@example.com§'
      fill_in 'Password', with: '123'
      click_button 'Sign in'
    end

    expect(page).to have_text('Invalid email or password.')
  end
end
