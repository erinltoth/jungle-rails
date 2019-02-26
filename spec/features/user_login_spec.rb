require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  before :each do
    @user = User.create!(
      first_name: "Lola",
      last_name: "Dog",
      email: "lola@dog.com",
      password: "password"
    ) 
  end

  scenario "they can login with a registered account" do
    visit '/login'

    within 'form' do
      fill_in id: 'email', with: 'lola@dog.com'
      fill_in id: 'password', with: 'password'

      click_button 'Submit'
    end    

    expect(page).to have_content 'Lola'
  end
end
