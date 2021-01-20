# frozen_string_literal: true

class Item < ApplicationRecord
  has_many :subitems, dependent: :destroy
  belongs_to :user

  validates :todo, presence: true, length: { minimum: 3, maximum: 200 }
end
