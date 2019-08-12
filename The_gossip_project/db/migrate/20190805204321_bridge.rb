class Bridge < ActiveRecord::Migration[6.0]
  def change
  	add_reference :joins, :tag, foreign_key: true
	add_reference :joins, :gossipp, foreign_key: true
  end
end
