class Project < ApplicationRecord
  include Concerns::Notable
  include Concerns::Avatarable

  belongs_to :client

  has_many :deadlines
  has_many_attached :documents

  enum status: { ready: 0, going: 1, finalised: 2 }
end
