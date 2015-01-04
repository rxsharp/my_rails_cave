class CreateLearningStatuses < ActiveRecord::Migration
  def change
    create_table :learning_statuses do |t|
      t.text :learning_status
      t.references :user, index: true

      t.timestamps
    end
  end
end
