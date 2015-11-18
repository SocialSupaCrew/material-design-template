class CreateUserMails < ActiveRecord::Migration
  def change
    create_table :user_mails do |t|
      t.string :email
      t.boolean :newsletter
      t.boolean :present
      t.string :firstname
      t.string :lastname

      t.timestamps
    end
  end
end
