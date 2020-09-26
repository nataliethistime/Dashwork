class AddReviewsApp < ActiveRecord::Migration[6.0]
  def change
    change_table :tenants do |t|
      t.boolean :reviews_app, default: false
    end
  end
end
