class SessionController < ApplicationController
  respond_to :json

  def create
    session[:user_tz] = params[:timeZoneName]
    respond_to do |format|
      format.json { head :ok }
    end
  end
end
