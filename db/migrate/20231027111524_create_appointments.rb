class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true
      t.date :date
      t.time :time
      t.integer :duration

      t.timestamps
    end
    add_index :appointments, [:user_id, :doctor_id], unique: true
  end
end
