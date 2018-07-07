require 'rails_helper'

describe "User sees all jobs" do
  scenario "a user sees all the jobs for a specific company" do
    category_1 = Category.create!(title: 'Web Development')
    category_2 = Category.create!(title: 'Education')
    company = Company.create!(name: "ESPN")
    job_1 = Job.create!(title: "Developer", level_of_interest: 90, city: "Denver", company_id: company.id, category_id: category_1.id)
    job_2 = Job.create!(title: "Teacher", level_of_interest: 10, city: "Boulder", company_id: company.id, category_id: category_2.id)

    visit company_path(company)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("Teacher")
  end
end
