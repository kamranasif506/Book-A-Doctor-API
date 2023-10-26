class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :doctor_name
      t.string :profile_picture
      t.text :bio
      t.time :time_available_from
      t.time :time_available_to
      
      t.references :specialization, foreign_key: true

      t.timestamps
    end
  end
end
