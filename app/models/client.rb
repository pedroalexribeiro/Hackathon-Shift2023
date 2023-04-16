class Client < ApplicationRecord
  include Concerns::Avatarable

  belongs_to :freelancer

  has_many :projects

  def visible_name
    name || 'Antonio'
  end

  def finalised_projects
    projects.map{|p| p if p.finalised?}.compact
  end

  def ongoing_projects
    # projects.where(status: Project.statuses[:going])
    projects.map{|p| p if p.going?}.compact
  end
end
