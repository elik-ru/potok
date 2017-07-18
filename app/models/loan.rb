# frozen_string_literal: true

class Loan < ApplicationRecord
  has_many :payments, dependent: :destroy
  accepts_nested_attributes_for :payments

  validates_numericality_of :amount, greater_than: 0, allow_blank: true
  validates_presence_of :amount

  def returned_amount
    payments.map(&:amount).reduce(&:+) || 0
  end

  def profit
    returned_amount - amount
  end

  def profitability
    return 0 if amount.zero?
    profit / amount / 6 * 12
  end

  # Средняя прибыльность по всем кредитам
  def self.profitability
    loans = all.includes(:payments)
    return 0.3 unless loans.any?
    loans.map(&:profit).reduce(&:+) / loans.map(&:amount).reduce(&:+) / 6 * 12
  end

  # rubocop:disable Metrics/AbcSize
  def self.reset!
    destroy_all

    ul1 = Loan.create(amount: 1_000_000)
    (0..5).each { |i| ul1.payments.create(month: i, amount: 191_666.67) }

    ul2 = Loan.create(amount: 1_000_000)
    (0..2).each { |i| ul2.payments.create(month: i, amount: 191_666.67) }
    ul2.payments.create(month: 3, amount: 525_000)
    (4..5).each { |i| ul2.payments.create(month: i, amount: 0) }

    ul3 = Loan.create(amount: 1_000_000)
    (0..1).each { |i| ul3.payments.create(month: i, amount:  191_666.67) }
    (2..5).each { |i| ul3.payments.create(month: i, amount:  208_333.33) }
  end
end
