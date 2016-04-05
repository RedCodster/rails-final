class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.belongs_to :user, index:true
      t.belongs_to :quiz, index:true
      t.integer 'score'

      t.timestamps null: false
    end
  end
end
