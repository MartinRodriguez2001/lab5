class ChatsController < ApplicationController
  load_and_authorize_resource
  def index
    @chats = Chat.all
  end
  def show
    @chat = Chat.find(params[:id])
  end
  def new
    @chat = Chat.new
    authorize! :new, @chat
  end

  def edit
    @chat = Chat.find(params[:id])
  end

  def update
    @chat = Chat.find(params[:id])
    if @chat.update(chat_params)
      redirect_to @chat, notice: "Chat updated successfully."
    else
      render :edit
    end
  end
  def destroy
    @chat = Chat.find(params[:id])
    @chat.destroy
    redirect_to chats_path, notice: "Chat eliminado exitosamente."
  end



  def create
    @chat = Chat.new(chat_params)
    @chat.sender_id = current_user.id
    if @chat.save
      redirect_to @chat, notice: "Chat creado exitosamente."
    else
      render :new, status: :unprocessable_entity
    end
  end


  private
  def chat_params
    params.require(:chat).permit(:sender_id, :receiver_id)
  end
end
