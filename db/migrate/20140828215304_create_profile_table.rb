class CreateProfileTable < ActiveRecord::Migration
  def up
  		create_table :profiles do |t|
  			t.integer :owner_id
  			t.string :dogname
  			t.string :dogtype
  			t.integer :dogcount
  end
end

def down
	drop_table :profiles
	end
end
