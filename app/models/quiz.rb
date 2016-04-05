class Quiz < ActiveRecord::Base
  has_many :questions

  has_many :results
  has_many :users, through: :results

  # This is required so that we can update the nested Questions data in bulk
  accepts_nested_attributes_for :questions, allow_destroy: true
end
