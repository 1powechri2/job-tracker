require 'rails_helper'

describe 'User sees all comments for a single job' do
  describe 'a user can see all comments for a job' do
    category = Category.create!(title: 'Web Development')
    company = Company.create!(name: "ESPN")
    comment_1 = Comment.create!(tbd)
    comment_2 = Comment.create!(tbd)
    job = Job.create!(title: "Developer", level_of_interest: 90, city: "Denver", company_id: company.id, category_id: category.id)

    visit company_job_path(company.id, job.id)

    expect(page).to have_content(comment_1)
    expect(page).to have_content(comment_2)
  end
end
