require 'rails_helper'

describe "User can visit /dashboard" do
  scenario "a user can see the page header" do

    visit '/dashboard'

    expect(page).to have_content("Job Tracker")
  end

end
