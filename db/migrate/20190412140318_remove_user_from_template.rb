class RemoveUserFromTemplate < ActiveRecord::Migration[5.2]
  def up
    remove_reference :templates, :user, index: true
  end
  def down
    add_reference :templates, :user, index: true
  end
end
