class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides


  def mood
  	unless happiness.nil? || nausea.nil?
  		happiness >= nausea ? "happy" : "sad"
  	end
  end
end


# schema
# 	create_table :users do |t|
#   		t.string :name
#   		t.integer :nausea
#   		t.integer :happiness
#   		t.integer :tickets
#   		t.integer :height

#   		t.timestamps null: false