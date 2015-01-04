class CreateLearningTools < ActiveRecord::Migration
  def change
    create_table :learning_tools do |t|
      t.string :learning_material
      t.string :learning_section
      t.text :progress
      t.references :user, index: true

      t.timestamps
    end
  end
end
