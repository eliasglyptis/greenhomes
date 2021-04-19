class RenameTheColumnTypeToDisplay < ActiveRecord::Migration[6.0]
  def change
    rename_column :projects, :type, :display
    execute "ALTER TABLE projects ALTER display DROP DEFAULT;"
    change_column :projects, :display, :integer, using: 'display::integer', default: 1
  end
end
