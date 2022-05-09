class CreateIndustries < ActiveRecord::Migration[7.0]
  def change
    create_table :industries do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
