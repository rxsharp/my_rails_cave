class CreateHubLists < ActiveRecord::Migration
  def change
    create_table :hub_lists do |t|
      t.string :github
      t.string :bitbucket
      t.string :codepen
      t.references :user, index: true

      t.timestamps
    end
  end
end
