module DelegatedType
  class Entry < ApplicationRecord
    delegated_type :entryable, types: %w[ Message Note ], dependent: :destroy

    delegate :title, to: :entryable

    def entryable_partial
      case entryable_type
      when 'DelegatedType::Message'
        'delegated_type/messages/message'
      when 'DelegatedType::Note'
        'delegated_type/notes/note'
      end
    end
  end
end