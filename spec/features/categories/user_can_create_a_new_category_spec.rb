require 'rails_helper'

describe "User creates a new category" do
  scenario "a user can create a new category" do

    visit new_category_path

    fill_in "category[title]", with: "Web Development"
    click_button "Create"

    expect(page).to have_content("Web Development")
  end
end
