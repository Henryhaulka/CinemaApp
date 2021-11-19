class RemoveNamerFromComments < ActiveRecord::Migration[6.1]
  def change
    remove_column :comments, :namer, :string
  end
end
