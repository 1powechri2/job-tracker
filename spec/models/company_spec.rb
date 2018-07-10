require 'rails_helper'

describe Company do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        company = Company.new()
        expect(company).to be_invalid
      end

      it "has a unique name" do
        Company.create(name: "Dropbox")
        company = Company.new(name: "Dropbox")
        expect(company).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name" do
        company = Company.new(name: "Dropbox")
        expect(company).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many jobs" do
      company = Company.new(name: "Dropbox")
      expect(company).to respond_to(:jobs)
    end
  end

  describe 'class methods' do
    it 'can rank top three companies by average level of interest' do
      category_1 = Category.create!(title: 'Web Development')
      category_2 = Category.create!(title: 'Education')
      category_3 = Category.create!(title: 'Sales')
      category_4 = Category.create!(title: 'Accounting')
      company_1 = Company.create!(name: "ESPN")
      company_2 = Company.create!(name: "Turing")
      company_3 = Company.create!(name: "Macy's")
      company_4 = Company.create!(name: "Adidas")
      job_1 = Job.create!(title: "Developer", level_of_interest: 4, city: "Denver", company_id: company_1.id, category_id: category_1.id)
      job_2 = Job.create!(title: "Teacher", level_of_interest: 6, city: "Boulder", company_id: company_2.id, category_id: category_2.id)
      job_3 = Job.create!(title: "Sales Rep", level_of_interest: 2, city: "New York", company_id: company_3.id, category_id: category_1.id)
      job_4 = Job.create!(title: "Accountant", level_of_interest: 5, city: "Seattle", company_id: company_4.id, category_id: category_4.id)
      job_5 = Job.create!(title: "Developer", level_of_interest: 8, city: "Denver", company_id: company_1.id, category_id: category_1.id)
      job_6 = Job.create!(title: "Teacher", level_of_interest: 14, city: "Boulder", company_id: company_2.id, category_id: category_2.id)
      job_7 = Job.create!(title: "Sales Rep", level_of_interest: 8, city: "New York", company_id: company_3.id, category_id: category_1.id)
      job_8 = Job.create!(title: "Accountant", level_of_interest: 1, city: "Seattle", company_id: company_4.id, category_id: category_4.id)

      
    end
  end
end
