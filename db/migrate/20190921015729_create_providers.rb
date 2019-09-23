class CreateProviders < ActiveRecord::Migration[6.0]
  def change
    create_table :providers do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :office_address, null: false
      t.string :office_city, null: false
      t.string :office_state, null: false
    end
  end
end
