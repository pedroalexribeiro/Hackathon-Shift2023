class Client < ApplicationRecord
  include Concerns::Avatarable

  belongs_to :freelancer

  has_many :projects

  def visible_name
    name || 'Antonio'
  end

  def finalised_projects
    projects.where('status <> ?', Project.statuses[:finalised])
  end

  def ongoing_projects
    projects.where('status <> ?', Project.statuses[:going])
  end
end
