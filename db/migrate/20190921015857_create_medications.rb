class CreateMedications < ActiveRecord::Migration[6.0]
  def change
    create_table :medications do |t|
      t.string :medication_name, null: false
      t.string :manufacturer, null: false
    end
  end
end
