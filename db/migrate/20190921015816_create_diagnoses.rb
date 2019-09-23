class CreateDiagnoses < ActiveRecord::Migration[6.0]
  def change
    create_table :diagnoses do |t|
      t.string :name, null: false
      t.string :diagnosis_code, null: false
    end
  end
end
