class Clients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
    t.text :name
    t.text :phone
    t.text :datetime
    t.text :barber
    t.text :color

        t.timestamps
    end
  end
end
