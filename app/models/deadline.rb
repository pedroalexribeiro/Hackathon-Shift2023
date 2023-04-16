class Deadline < ApplicationRecord
  include Concerns::Notable

  belongs_to :project

  has_many_attached :documents

  enum status: { ready: 0, going: 1, finalised: 2 }
end
