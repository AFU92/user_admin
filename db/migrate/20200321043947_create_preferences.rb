# frozen_string_literal: true

class CreatePreferences < ActiveRecord::Migration[5.2]
  def change
    create_table :preferences do |t|
      t.string :description
      t.string :data, array: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end