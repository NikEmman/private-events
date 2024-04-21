class RemoveCreatorFromEvents < ActiveRecord::Migration[7.1]
  def change
    remove_column :events, :creator, :integer
  end
end
