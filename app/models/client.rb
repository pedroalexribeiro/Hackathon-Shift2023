class Client < ApplicationRecord
  include Concerns::Avatarable

  belongs_to :freelancer

  has_many :projects

  def finalised_projects
    projects.where('status <> ?', Project.statuses[:finalised])
  end

  def ongoing_projects
    projects.where('status <> ?', Project.statuses[:going])
  end
end
