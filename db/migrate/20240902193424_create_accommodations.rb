class CreateAccommodations < ActiveRecord::Migration[7.0]
  def change
    create_table :accommodations do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :accommodation_type, null: false
      t.integer :vacancies, null: false
      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :postal_code, null: false
      t.string :amenities, array: true, default: [] 
      t.string :photos, array: true, default: []   
      t.date :available_dates, array: true, default: []
      t.integer :min_stay
      t.integer :max_stay
      t.string :volunteer_preferences
      t.string :work_schedule
      t.text :tasks_description
      t.timestamps
    end
  end
end
