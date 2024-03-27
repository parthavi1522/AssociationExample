module DelegatedTypes
  extend ActiveSupport::Concern

  included do
    has_many :entries, as: :entryable
  end
end