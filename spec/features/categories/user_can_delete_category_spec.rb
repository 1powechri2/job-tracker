require 'rails_helper'

describe "User deletes existing category" do
  scenario "a user can delete a category" do
    category = Category.create(title: "Web Development")

    visit categories_path
    click_link('Delete')

    expect(current_path).to eq(categories_path)
    expect(page).to_not have_content("Web Development")
  end
end
