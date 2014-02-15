class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |col|
      col.string :search_term
    end
  end
end
