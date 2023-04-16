class Client < ApplicationRecord
  include Concerns::Avatarable

  belongs_to :freelancer

  has_many :projects

  after_create :set_access_code

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

  def set_access_code
    self.access_code = (0...8).map { (65 + rand(26)).chr }.join
    save
  end
end
