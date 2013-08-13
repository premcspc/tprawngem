class CreateContentForms < ActiveRecord::Migration
  def change
    create_table :content_forms do |t|
      t.string :title
      t.text :content
      t.datetime :date

      t.timestamps
    end
  end
end
