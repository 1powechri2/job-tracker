require 'rails_helper'
describe Comment do
  describe 'validations' do
    context 'invalid attributes' do
      it 'is invalid without content' do
        category = Category.create!(title: 'Web Development')
        company = Company.create!(name: "ESPN")
        job = Job.create!(title: "Developer",
                          level_of_interest: 90,
                          city: "Denver",
                          company_id: company.id,
                          category_id: category.id
                          )
        comment = Comment.create()

        expect(comment).to be_invalid
      end
    end

    context 'valid attributes' do
      it 'is valid with content' do
        category = Category.create!(title: 'Web Development')
        company = Company.create!(name: "ESPN")
        job = Job.create!(title: "Developer",
                          level_of_interest: 90,
                          city: "Denver",
                          company_id: company.id,
                          category_id: category.id
                          )
        comment = Comment.create(content: 'string of lalalala', job_id: job.id)

        expect(comment).to be_valid
      end
    end
  end
  describe 'relationships' do
    it 'belongs to a job' do
      category = Category.create!(title: 'Web Development')
      company = Company.create!(name: "ESPN")
      job = Job.create!(title: "Developer",
                        level_of_interest: 90,
                        city: "Denver",
                        company_id: company.id,
                        category_id: category.id
                        )
      comment = Comment.create(content: 'string of lalalala', job_id: job.id)

      expect(job).to respond_to(:comments)
    end
  end
end
