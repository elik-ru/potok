# frozen_string_literal: true

class IndexController < ApplicationController
  def index
    @loans = Loan.all.includes(:payments)
  end

  def calculate
    @loans = Loan.all.includes(:payments)
    @newloan = params[:amount]&.presence&.to_f

    flash.now[:error] = 'Укажите сумму' unless @newloan

    render :index
  end
end
