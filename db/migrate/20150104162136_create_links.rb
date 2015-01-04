class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.text :title
      t.string :description
      t.string :link
      t.references :user, index: true

      t.timestamps
    end
  end
end
