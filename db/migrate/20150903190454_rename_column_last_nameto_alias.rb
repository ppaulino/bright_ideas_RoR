class RenameColumnLastNametoAlias < ActiveRecord::Migration
  def change
  	rename_column :users, :last_name, :alias
  end
end
