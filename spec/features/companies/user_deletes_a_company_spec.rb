require 'rails_helper'

describe "User deletes existing company" do
  scenario "a user can delete a company" do
    company = Company.create(name: "ESPN")

    visit company_path(company)
    click_link 'Delete'

    expect(current_path).to eq(companies_path)
    expect(page).to_not have_content("ESPN")
  end
end
