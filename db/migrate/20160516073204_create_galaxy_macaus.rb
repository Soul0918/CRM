class CreateGalaxyMacaus < ActiveRecord::Migration
  def change
    create_table :galaxy_macaus do |t|
      t.string :contact
      t.string :openid
      t.string :url
      t.datetime :time

      t.timestamps null: false
    end
  end
end
