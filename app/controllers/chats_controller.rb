class ChatsController < ApplicationController
  def show
    #roomがすでに存在している時の動き
    @user = User.find(params[:id])
    rooms = current_user.user_rooms.pluck(:room_id)  #ここで、自分のidが入っていたroomのidだけを取得
    user_rooms = UserRoom.find_by(user_id: @user.id, room_id: rooms) #@user.id(相手のid)と、rooms(自分のidがあるroom)
    
    if user_rooms.nil?  #自分と相手のroomが存在しない時の処理=>新しいroomを作成する処理。
      @room = Room.new
      @room.save
      UserRoom.create(user_id: @user_id, room_id: @room.id)
      UserRoom.create(user_id: @current_user.id, room_id: @room.id)
    else
      @room =user_rooms.room
    end
    @chats = @room.chats 
    @chat = Chat.new(room_id: @room.id)
  end
  
  def create
    @chat = current_user.chats.new(chat_params)
    @chat.save
  end
  
  private
  
  def chat_params
    params.require(:chat).permit(:message, :room_id)
  end
end
