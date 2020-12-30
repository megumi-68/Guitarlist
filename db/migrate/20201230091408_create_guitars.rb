class CreateGuitars < ActiveRecord::Migration[5.2]
  def change
    create_table :guitars do |t|
      t.string :content
      t.references :user, foreign_key: true
      t.string :category
      t.string :photo
      t.string :name

      t.timestamps
    end
  end
end
