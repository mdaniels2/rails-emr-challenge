class CreateVisits < ActiveRecord::Migration[6.0]
  def change
    create_table :visits do |t|
      t.references :patient, null: false, foreign_key: true
      t.references :provider, null: false, foreign_key: true
      t.timestamp :visit_date, null: false
      t.string :notes
    end
  end
end
