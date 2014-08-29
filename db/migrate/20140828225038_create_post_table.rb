class CreatePostTable < ActiveRecord::Migration
  def up
  	create_table :posts do |t|
  	t.string :title
  	t.string :body
  	t.integer :user_id
  end
end

def down
	drop_table :posts
end
end
