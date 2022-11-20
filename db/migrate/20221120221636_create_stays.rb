# frozen_string_literal: true

class CreateStays < ActiveRecord::Migration[7.0]
  def change
    create_table :stays do |t|
      t.string :name, null: false
      t.string :location, null: false
      t.datetime :date_from, null: false
      t.datetime :date_to, null: false
      t.string :price, null: false
      t.integer :rating
      t.references :host, foreign_key: { to_table: :users }, null: false

      t.timestamps
    end
  end
end
