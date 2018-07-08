require 'rails_helper'

describe 'User sees all comments on job show page' do
  scenario 'a user can see all comments for a job' do
    category = Category.create!(title: 'Web Development')
    company = Company.create!(name: "ESPN")
    job = Job.create!(title: "Developer", level_of_interest: 90, city: "Denver", company_id: company.id, category_id: category.id)
    comment_1 = Comment.create!(content: 'tbd', job_id: job.id)
    comment_2 = Comment.create!(content: 'tbddfr00000', job_id: job.id)

    visit company_job_path(company, job)

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{job.id}")
    expect(page).to have_content(comment_1.content)
    expect(page).to have_content(comment_2.content)
  end
end
