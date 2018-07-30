class ChatController < ApplicationController
  before_action :auth

  def create
    ActionCable.server.broadcast 'chat',
             message: params[:message][:body],
             username: cookies.signed[:username]
    head :ok
  end

  private

  def auth
    redirect_to new_session_path unless cookies.signed[:username].present?
  end
end
