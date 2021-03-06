class CreateUsers < ActiveRecord::Migration
  
  def self.up
    
    create_table :users do |t|
      
      t.string          :email, :username, :first_name, :last_name
      t.string          :crypted_password, :password_salt, :persistence_token
      t.string          :perishable_token, :default => "", :null => false 
      t.string          :time_zone, :default => 'Eastern Time (US & Canada)'
      t.timestamps
      
      t.boolean         :active, :default => true
      
      # Magic columns automatically maintained by Authlogic
      t.integer         :login_count,         :null => false, :default => 0
      t.integer         :failed_login_count,  :null => false, :default => 0
      t.datetime        :last_request_at
      t.datetime        :current_login_at
      t.datetime        :last_login_at
      t.string          :current_login_ip
      t.string          :last_login_ip
      
    end
  
    add_index :users, :email
    add_index :users, :username  
    add_index :users, :persistence_token
    add_index :users, :perishable_token  
    add_index :users, :last_request_at
  
  end

  def self.down
    drop_table :users
  end
  
end