# frozen_string_literal: true

module Concerns
  module Notable
    extend ActiveSupport::Concern

    included do
      has_many :notes
    end

    def notes_by_client(client)
      
    end

    def my_notes
    end
  end
end
