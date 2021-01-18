# frozen_string_literal: true

class Item < ApplicationRecord
  has_many :subitems, dependent: :destroy
  belongs_to :user
end
