class Blog < ApplicationRecord
  validates :content, {presence: true, length: { in: 1..140, message: "cannot type more than 140 characters" }}
end
