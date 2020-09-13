class Artist < ApplicationRecord
  has_many :records, dependent: :destroy

  validate :name, presence: true
end
