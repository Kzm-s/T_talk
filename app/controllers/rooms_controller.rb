class RoomsController < ApplicationController

    def create
        @room = Room.create
        @entryCurrentUser = UserRoom.create(user_id: current_user.id, room_id: @room.id)
        @entryUser = UserRoom.create(entry_room_params)
        redirect_to room_path(@room.id)
    end


    def show
        @room = Room.find(params[:id])
        if UserRoom.where(user_id: current_user.id, room_id: @room.id).present?
            @messages = @room.messages
            @message = Message.new
            @UserRooms = @room.room_users

        end
    end

    private
    
    def entry_room_params
        params.permit(:user_id, :room_id).merge(room_id: @room.id)
    end

end
