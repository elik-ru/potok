# frozen_string_literal: true

class Payment < ApplicationRecord
  belongs_to :loan
  validates_presence_of :amount
  validates_numericality_of :amount, greater_than_or_equal_to: 0, allow_blank: true
end
