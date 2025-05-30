class MessagesController < ApplicationController
  load_and_authorize_resource

  def index
    @messages = Message.all
  end
  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
  end

  def edit
  end

  def update
    if @message.update(message_params)
      redirect_to @message, notice: "Message updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to messages_path, notice: "Mensaje eliminado correctamente."
  end



  def create
    @message = Message.new(message_params)
    @message.user = current_user
    if @message.save
      redirect_to messages_path, notice: "Message created successfully."
    else
      render :new
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :chat_id)
  end
end
