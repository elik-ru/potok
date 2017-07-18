# frozen_string_literal: true

class LoansController < ApplicationController
  def new
    @loan = Loan.new
    6.times { @loan.payments.build }
  end

  def create
    @loan = Loan.create(safe_params)
    if @loan.valid?
      flash[:success] = 'Займ добавлен'
      redirect_to [:root]
    else
      render :new
    end
  end

  def reset
    Loan.reset!
    redirect_to :root
  end

  def safe_params
    params.require(:loan).permit(:amount, payments_attributes: %i[amount month])
  end
end
