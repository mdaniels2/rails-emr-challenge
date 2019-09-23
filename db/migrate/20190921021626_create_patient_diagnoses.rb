class CreatePatientDiagnoses < ActiveRecord::Migration[6.0]
  def change
    create_table :patient_diagnoses do |t|
      t.references :diagnosis, null: false, foreign_key: true
      t.references :patient, null: false, foreign_key: true
      t.references :provider, null: false, foreign_key: true
      t.timestamp :start_date, null: false
      t.timestamp :end_date
    end
  end
end
