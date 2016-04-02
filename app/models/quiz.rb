class Quiz < ActiveRecord::Base
  has_many :questions
  belongs_to :user

  # This is required so that we can update the nested Questions data in bulk
  accepts_nested_attributes_for :questions
end
