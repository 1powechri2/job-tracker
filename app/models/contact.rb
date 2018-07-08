class Comment < ApplicationRecord
  validates_presence_of :name, :title, :email
  belongs_to :company
end
