class ConversationsController < ApplicationController
  def index
    @users = User.where.not("id = ? ", current_user.id)
    @converstions = Conversation.where("(sender_id = ? ) OR (recipient_id = ? )", current_user.id, current_user.id)
  end

  def show
    @conversation = Conversation.find(params[:id])
    @opposed_user = @conversation.opposed_user(current_user)
  end

  def create
    @conversation = Conversation.get(current_user.id, params[:user_id])

    respond_to do |format|
      format.js
    end
  end

  private


end
