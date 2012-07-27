class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :confirm_password
      t.date :date_of_birth
      t.string :age
      t.string :gender
      t.string :course_required
      t.string :fee
      t.string :duration
      t.string :description
      t.string :mail_id
      t.string :qualification

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
