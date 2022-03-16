class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.string :patient_first_name
      t.string :patient_last_name
      t.string :date, :null => false
      t.string :time, :null => false
      t.string :kind
      t.references :doctor

      t.timestamps
    end
  end
end
