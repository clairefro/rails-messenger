class MessagesController < ApplicationController
   def create
    @conversation = Conversation.includes(:recipient).find(params[:conversation_id])
    @message = @conversation.messages.create(message_params)

    if @message.save
      respond_to do |format|
        format.html { redirect_to conversation_path(@conversation) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'conversations/show' }
        format.js  # <-- idem
      end
    end
    # redirect_to conversation_path(@conversation)
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :body)
  end
end
