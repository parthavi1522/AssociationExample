module DelegatedType
  class Note < ApplicationRecord
    include DelegatedTypes

    def title
      content.truncate(20)
    end
  end
end