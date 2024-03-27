module DelegatedType
  class Message < ApplicationRecord
    include DelegatedTypes

    def title
      subject
    end
  end
end