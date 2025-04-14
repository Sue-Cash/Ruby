class CreateStepEntries < ActiveRecord::Migration[7.2]
  def change
    create_table :step_entries do |t|
      t.integer :steps
      t.date :date

      t.timestamps
    end
  end
end
