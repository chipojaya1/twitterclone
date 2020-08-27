class Blog < ApplicationRecord
  validates :content, {presence: true, length: { in: 1..140, message: "cannot type more than 140 characters" }}
  belongs_to :user
  belongs_to :blog, optional: true
end
