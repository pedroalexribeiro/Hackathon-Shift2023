class Freelancer < ApplicationRecord
  include Concerns::Avatarable

  has_many :clients
  has_many :projects, through: :clients

  before_create :set_nounce

  attr_accessor :eth_message, :eth_signature

  def set_nounce
    self.eth_nonce = SecureRandom.uuid
  end

  def visible_name
    name || 'Jorge'
  end
end
