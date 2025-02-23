class CreateBooks < ActiveRecord::Migration[7.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :edition
      t.string :author
      t.string :series_name
      t.string :publisher
      t.string :publication_year
      t.string :jp_no
      t.string :isbn
      t.string :ndc
      t.string :ndc1
      t.string :subject
      t.string :size
      t.string :page_count
      t.string :price

      t.timestamps
    end
  end
end
