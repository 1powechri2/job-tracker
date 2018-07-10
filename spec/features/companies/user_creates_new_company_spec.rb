require 'rails_helper'

describe "User creates a new company" do
  scenario "a user can create a new company" do
    company_name = 'ESPN'
    visit new_company_path

    fill_in :company_name, with: company_name
    click_button "Create"

    expect(page).to have_content("ESPN")
    expect(Company.count).to eq(1)
  end
end
