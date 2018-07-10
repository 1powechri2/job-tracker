require 'rails_helper'

describe "User creates a new category" do
  scenario "a user can create a new category" do
    category_title = 'Web Development'

    visit new_category_path
    fill_in :category_title, with: category_title
    click_button "Create"

    expect(current_path).to eq(categories_path)
    expect(page).to have_content("Web Development")
    expect(Category.count).to eq(1)
  end
end
