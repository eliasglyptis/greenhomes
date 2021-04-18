class RenameTheColumnTypeToDisplay < ActiveRecord::Migration[6.0]
  def change
    rename_column :projects, :type, :display
    change_column :projects, :display, :integer, default: 1, using: 'display::integer'
  end
end
