class ChatsController < ApplicationController
  def index
    @chats = Chat.all
  end

  def show
    @chats = Chat.find(params[:id])
  end
end
