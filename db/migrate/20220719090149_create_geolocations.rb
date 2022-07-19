class CreateGeolocations < ActiveRecord::Migration[6.0]
  def change
    create_table :geolocations do |t|
      t.string :geolocatable_type
      t.bigint :geolocatable_id
      t.string :longitude
      t.string :latitude

      t.timestamps
    end
  end
end
