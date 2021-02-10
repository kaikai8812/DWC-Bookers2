class Delete < ActiveRecord::Migration[5.2]
  def change
    drop_table :entries
    drop_table :rooms
    drop_table :user_rooms
    drop_table :chats
    
  end
end
