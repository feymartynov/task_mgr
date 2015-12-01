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
end
