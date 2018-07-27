class SessionsController < ApplicationController
  def create
    cookies.signed[:username] = params[:session][:username]
    redirect_to chat_index_path
  end
end
