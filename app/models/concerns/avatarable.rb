# frozen_string_literal: true

module Concerns
  module Avatarable
    extend ActiveSupport::Concern

    included do
      has_one_attached :avatar do |attachable|
        attachable.variant :thumb, resize_to_limit: [100, 100]
      end
    end

    def round_avatar
      return avatar.variant(:thumb) if avatar.attached?

      'https://raw.githubusercontent.com/twbs/icons/main/icons/person.svg'
    end
  end
end
