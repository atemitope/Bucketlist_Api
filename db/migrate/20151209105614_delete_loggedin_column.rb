class DeleteLoggedinColumn < ActiveRecord::Migration
  def change
    remove_column :users, :logged_in
  end
end
