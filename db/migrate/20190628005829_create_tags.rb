class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :title
      t.references :note, foreign_key: true

      t.timestamps
    end
  end
end