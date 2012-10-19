class CreatePage < ActiveRecord::Migration
  def up
    create_table :pages do |t|
      t.string :name
      t.string :content

      t.timestamps
    end
  end

  def down
  end
end
