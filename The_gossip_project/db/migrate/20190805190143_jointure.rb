class Jointure < ActiveRecord::Migration[6.0]
  def change
  	add_reference :users, :city, foreign_key: true
  	add_reference :gossipps, :user, foreign_key: true
  	
  end
end
