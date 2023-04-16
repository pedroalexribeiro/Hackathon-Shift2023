class Project < ApplicationRecord
  include Concerns::Notable
  include Concerns::Avatarable

  belongs_to :client

  has_many :deadlines
  has_many :documents

  enum status: { ready: 0, going: 1, finalised: 2 }

  def finalised?
    deadlines.any? && deadlines.where(status: [Deadline.statuses[:going], Deadline.statuses[:ready]]).empty?
  end

  def going?
    deadlines.where(status: Deadline.statuses[:going]).any?
  end
end
