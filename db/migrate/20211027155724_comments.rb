class Comments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
    t.text :name

        t.timestamps
    end
  end
end
