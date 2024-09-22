class CreateImages < ActiveRecord::Migration[7.2]
  def change
    create_table :images do |t|
      t.references :Imageable, polymorphic: true, null: false
      t.text :file

      t.timestamps
    end
  end
end
