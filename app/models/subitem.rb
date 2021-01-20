# frozen_string_literal: true

class Subitem < ApplicationRecord
  belongs_to :item

  validates :title, presence: true, length: { minimum: 3, maximum: 200 }
end
