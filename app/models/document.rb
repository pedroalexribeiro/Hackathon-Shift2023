class Document < ApplicationRecord
  belongs_to :source, polymorphic: true
  belongs_to :author, polymorphic: true

  has_one_attached :file
end
