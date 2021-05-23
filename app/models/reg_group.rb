class RegGroup < ApplicationRecord
  validates :group_name, presence: true, length: {maximum: 50}
  has_many :scrapings
end
