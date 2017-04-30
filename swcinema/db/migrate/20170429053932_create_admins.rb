class CreateAdmins < ActiveRecord::Migration[5.1]
  def change
    create_table :admins do |t|
      t.string :id_movie
      t.string :name
      t.string :time
      t.string :duration
      t.float :price
      t.string :id_seat
      t.string :status

      t.timestamps
    end
  end
end
