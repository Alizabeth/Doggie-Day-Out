class CreateOwnersTable < ActiveRecord::Migration
  def up
  		create_table :owners do |t|
  			t.string :fname
  			t.string :lname
  			t.string :email
  			t.string :password
  end
end


def down
		drop_table :owners
	end
end
