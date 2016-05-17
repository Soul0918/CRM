class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :uuid
      t.string :major
      t.string :minor
      t.string :distance
      t.string :ip
      t.date :date
      t.time :time

      t.timestamps null: false
    end
  end
end
