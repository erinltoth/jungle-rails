require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  before :each do
    @user = User.create!(
      name: "Lola",
      email: "lola@dog.com",
      password: "password"
    ) 
  end

  scenario "they can login with a registered account" do
    visit '/login'

    

  end
end
