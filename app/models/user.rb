class User < ActiveRecord::Base

  validates_presence_of :username, :password
  validates_uniqueness_of :username

  validates :password, length: { minimum: 8 }
  validates :username, length: { minimum: 4 }
  
  include BCrypt

  def password
    pwd = read_attribute(:password)
    if pwd.present?
      Password.new(pwd)
    else
      pwd
    end
  end

  def password=(pass)
    write_attribute(:password, Password.create(pass))
  end

  def valid_password?(pass)
    password == pass
  end
  
end