require 'rails_helper'

describe "User sees a specific job" do
  scenario "a user sees a job for a specific company" do
    category = Category.create!(title: 'Web Development')
    company = Company.create!(name: "ESPN")
    job = Job.create!(title: "Developer", level_of_interest: 90, city: "Denver", company_id: company.id, category_id: category.id)

    visit company_job_path(company, job)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("90")
  end
end
