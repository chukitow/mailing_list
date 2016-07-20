class DashboardController < ApplicationController
  before_action :authorize

  def index
    @mailings = Mailing.all
  end

  def show
    @mailing = Mailing.find(params[:id])
  end
end
