class Client < ApplicationRecord
  belongs_to :freelancer
  has_many :projects
end
