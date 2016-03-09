class Attraction < ActiveRecord::Base
  has_many :rides
  has_many :users, through: :rides
end

# schema
	# create_table :attractions do |t|
 # 		t.string :name
 # 		t.integer :nausea_rating
 # 		t.integer :happiness_rating
 # 		t.integer :min_height

 # 		t.timestamps null