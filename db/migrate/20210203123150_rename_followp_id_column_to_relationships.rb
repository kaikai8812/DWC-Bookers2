class RenameFollowpIdColumnToRelationships < ActiveRecord::Migration[5.2]
  def change
    rename_column :relationships, :followp_id, :followed_id
  end
end
