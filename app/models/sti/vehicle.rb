module Sti
  class Vehicle < ApplicationRecord
    default_scope { order(year: :desc) }
    scope :old, ->(year) { where("year <= ?", year) }
  end
end