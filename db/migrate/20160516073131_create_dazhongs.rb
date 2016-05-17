class CreateDazhongs < ActiveRecord::Migration
  def change
    create_table :dazhongs do |t|
      t.string :chudian
      t.string :openid
      t.string :url
      t.datetime :time

      t.timestamps null: false
    end
  end
end
