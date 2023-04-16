class Freelancer < ApplicationRecord
  include Concerns::Avatarable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :clients
  has_many :projects, through: :clients

  def visible_name
    name || 'Jorge'
  end
end
