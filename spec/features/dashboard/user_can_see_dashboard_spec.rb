require 'rails_helper'

describe "User can visit /dashboard" do
  scenario "a user can see the page header" do

    visit '/dashboard'

    expect(page).to have_content("Job Tracker")
  end

  scenario "a user can see a count of jobs by level of interest" do
    category_1 = Category.create!(title: 'Web Development')
    category_2 = Category.create!(title: 'Education')
    category_3 = Category.create!(title: 'Sales')
    category_4 = Category.create!(title: 'Accounting')
    company_1 = Company.create!(name: "ESPN")
    company_2 = Company.create!(name: "Turing")
    company_3 = Company.create!(name: "Macy's")
    company_4 = Company.create!(name: "Adidas")
    job_1 = Job.create!(title: "Developer", level_of_interest: 4, city: "Denver", company_id: company_1.id, category_id: category_1.id)
    job_2 = Job.create!(title: "Teacher", level_of_interest: 5, city: "Boulder", company_id: company_2.id, category_id: category_2.id)
    job_3 = Job.create!(title: "Sales Rep", level_of_interest: 2, city: "New York", company_id: company_3.id, category_id: category_1.id)
    job_4 = Job.create!(title: "Accountant", level_of_interest: 5, city: "Seattle", company_id: company_4.id, category_id: category_4.id)
    visit dashboard_path

    expect(page).to have_content("Jobs by Interest")
    expect(page).to have_content('5 Star Rating: (2) Job(s)')
    expect(page).to have_content("4 Star Rating: (1) Job(s)")
    expect(page).to have_content("2 Star Rating: (1) Job(s)")
  end
  # scenario "a user can see a count of jobs by level of interest" do
  #   category_1 = Category.create!(title: 'Web Development')
  #   category_2 = Category.create!(title: 'Education')
  #   category_3 = Category.create!(title: 'Sales')
  #   category_4 = Category.create!(title: 'Accounting')
  #   company_1 = Company.create!(name: "ESPN")
  #   company_2 = Company.create!(name: "Turing")
  #   company_3 = Company.create!(name: "Macy's")
  #   company_4 = Company.create!(name: "Adidas")
  #   job_1 = Job.create!(title: "Developer", level_of_interest: 4, city: "Denver", company_id: company_1.id, category_id: category_1.id)
  #   job_2 = Job.create!(title: "Teacher", level_of_interest: 5, city: "Boulder", company_id: company_2.id, category_id: category_2.id)
  #   job_3 = Job.create!(title: "Sales Rep", level_of_interest: 2, city: "New York", company_id: company_3.id, category_id: category_1.id)
  #   job_4 = Job.create!(title: "Accountant", level_of_interest: 5, city: "Seattle", company_id: company_4.id, category_id: category_4.id)
  #   job_1 = Job.create!(title: "Developer", level_of_interest: 4, city: "Denver", company_id: company_1.id, category_id: category_1.id)
  #   job_2 = Job.create!(title: "Teacher", level_of_interest: 5, city: "Boulder", company_id: company_2.id, category_id: category_2.id)
  #   job_3 = Job.create!(title: "Sales Rep", level_of_interest: 2, city: "New York", company_id: company_3.id, category_id: category_1.id)
  #   job_4 = Job.create!(title: "Accountant", level_of_interest: 5, city: "Seattle", company_id: company_4.id, category_id: category_4.id)
  #   visit dashboard_path
  #
  #   expect(page).to have_content("Jobs by Interest")
  #   expect(page).to have_content('5 Star Rating: (2) Job(s)')
  #   expect(page).to have_content("4 Star Rating: (1) Job(s)")
  #   expect(page).to have_content("2 Star Rating: (1) Job(s)")
end
