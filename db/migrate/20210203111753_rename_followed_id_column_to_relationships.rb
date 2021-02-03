class RenameFollowedIdColumnToRelationships < ActiveRecord::Migration[5.2]
  def change
    rename_column :relationships, :followed_id, :followp_id
  end
end
