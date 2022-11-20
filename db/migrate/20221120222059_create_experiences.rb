# frozen_string_literal: true

class CreateExperiences < ActiveRecord::Migration[7.0]
  def change
    create_table :experiences do |t|
      t.string :name, null: false
      t.integer :rating, null: false
      t.string :price, null: false
      t.references :host, foreign_key: { to_table: :users }, null: false

      t.timestamps
    end
  end
end
