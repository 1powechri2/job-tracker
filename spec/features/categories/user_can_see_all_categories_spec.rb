require 'rails_helper'

describe "User sees category index" do
  scenario "a user sees all of the categories" do
    category_1 = Category.create!(title: "Web Development")
    category_2 = Category.create!(title: "Education")

    visit categories_path

    expect(page).to have_content("Web Development")
    expect(page).to have_content("Education")
  end

end
