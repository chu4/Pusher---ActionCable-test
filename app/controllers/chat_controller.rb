class ChatController < ApplicationController
  before_action :auth

  def create
    Pusher.trigger('chat-channel', 'new-message', {
        message: params[:message][:body],
        username: cookies.signed[:username]
    })
  end

  private

  def auth
    redirect_to new_session_path unless cookies.signed[:username].present?
  end
end
