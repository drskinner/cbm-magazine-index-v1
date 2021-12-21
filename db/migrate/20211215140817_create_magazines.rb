class CreateMagazines < ActiveRecord::Migration[5.2]
  def change
    create_table :magazines do |t|
      t.string   :slug, null: false
      t.string   :name, null: false
      t.string   :alpha_guide, null: false

      t.timestamps
    end
  end
end
