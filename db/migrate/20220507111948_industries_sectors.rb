class IndustriesSectors < ActiveRecord::Migration[7.0]
  def change
    create_table :industries_sectors, id: false do |t|
      t.belongs_to :industry
      t.belongs_to :sector
    end
  end
end
