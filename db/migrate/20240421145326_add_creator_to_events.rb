class AddCreatorToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :creator, :integer
  end
end
