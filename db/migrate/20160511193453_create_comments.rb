class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body
      t.references :answer, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.datetime :confirmed_at

      t.timestamps null: false
    end
  end
end
