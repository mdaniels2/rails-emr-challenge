class CreateTreatments < ActiveRecord::Migration[6.0]
  def change
    create_table :treatments do |t|
      t.references :medication, null: false, foriegn_key: true
      t.references :patient, null: false, foriegn_key: true
      t.string :dosage, null: false
      t.timestamp :start_date, null: false
      t.timestamp :end_date
    end
  end
end
