require 'rails_helper'

describe "User edits an existing category" do
  scenario "a user can edit a category" do
    category = Category.create!(title: "Web Development")
    new_title = 'Software Engineer'
    visit edit_category_path(category)

    fill_in :category_title, with: new_title
    click_button "Update"

    expect(current_path).to eq(categories_path)
    expect(page).to_not have_content("Web Development")
    expect(page).to have_content("Software Engineer")
  end
end
