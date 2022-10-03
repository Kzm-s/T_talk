class MessagesController < ApplicationController
    before_action :authenticate_user! 

    def create
      if UserRoom.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
        @message = Message.new(message_params)
        if @message.valid?
          @message.save
          redirect_to room_path(@message.room_id)
        end
      else
        flash[:alert] = "メッセージの送信に失敗しました。"
      end
    end
   
    private
    def message_params
      params.require(:message).permit(:user_id, :room_id, :content, :image, :is_check).merge(user_id: current_user.id)
    end
end
