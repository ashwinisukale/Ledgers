class Transaction < ApplicationRecord
  validates :activity_id, presence: true, uniqueness: true
  validates :date, presence: true
  validates :amount, presence: true
  validates :balance, presence: true
  validates :transaction_type, presence: true
end
