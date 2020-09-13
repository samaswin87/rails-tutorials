class Record < ApplicationRecord
  belongs_to :user

  validate :title, :year, presence: true
end
