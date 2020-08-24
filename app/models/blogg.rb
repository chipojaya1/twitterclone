class Blogg < ApplicationRecord
  validates :content, {presence: true, length: {maximum: 140}}
end
