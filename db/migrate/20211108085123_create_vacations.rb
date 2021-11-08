class CreateVacations < ActiveRecord::Migration[6.1]
  def change
    create_table :vacations do |t|
      t.belongs_to :user
      t.belongs_to :destination
      t.timestamps
    end
  end
end
