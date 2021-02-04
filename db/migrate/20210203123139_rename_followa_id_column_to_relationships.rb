class RenameFollowaIdColumnToRelationships < ActiveRecord::Migration[5.2]
  def change
    rename_column :relationships, :followa_id, :following_id
  end
end
