class MailingsController < ApplicationController
  def show
    @mailing = Mailing.find(params[:id])
  end

  def new
    @mailing = Mailing.new
  end

  def create
    @mailing = Mailing.new(mailing_params)

    if @mailing.save
      redirect_to @mailing
    else
      render :new
    end
  end

  private
  def mailing_params
    params.require(:mailing).permit(:name, :email)
  end
end
