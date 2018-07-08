require 'rails_helper'

describe "User sees one company" do
  scenario "a user sees a company" do
    category = Category.create!(title: 'Web Development')
    company = Company.create!(name: "ESPN")
    job = Job.create!(title: "Developer", level_of_interest: 90, city: "Denver", company_id: company.id, category_id: category.id)

    visit company_path(company)

    expect(current_path).to eq("/companies/#{company.id}")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_link('Create A Job')
    expect(page).to have_link('See All Companies')
  end

  scenario "a user can create a contact" do
    category = Category.create!(title: 'Web Development')
    company = Company.create!(name: "ESPN")
    job = Job.create!(title: "Developer", level_of_interest: 90, city: "Denver", company_id: company.id, category_id: category.id)

    visit company_path(company)
    fill_in 'contact[name]', with: "Michelle Obama"
    fill_in 'contact[title]', with: "First Lady"
    fill_in 'contact[email]', with: "Michelle@gmail.com"
    click_on 'Save'

    expect(current_path).to eq("/companies/#{company.id}")
    expect(page).to have_content("Michelle Obama")
    expect(page).to have_content("First Lady")
    expect(page).to have_content("Michelle@gmail.com")
  end
end
