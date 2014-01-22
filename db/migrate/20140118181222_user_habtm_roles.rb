class UserHabtmRoles < ActiveRecord::Migration
  def self.up
    create_table :roles_users, :id => false do |t|
      t.references :role, :user
    end
  end

  def self.down
    drop_table :roles_users
  end
  add_index(:role_id, :user_id)
end
