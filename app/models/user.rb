# class EmailValidator < ActiveModel::EachValidator
#   # def validate_each(record, attribute, value)
#   #   unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
#   #     record.errors[attribute] << (options[:message] || "is not an email")
#   #   end
#   # end
# end

class User < ActiveRecord::Base
  has_many  :user_surveys
  has_many :surveys, through: :user_surveys
  has_many :surveys, { :class_name => "Survey", :foreign_key => :owner_id } 

  validates :password_hash, presence: true
  # validates :email, presence: true, uniqueness: true, email: true

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password_plaintext)
    @password = BCrypt::Password.create(new_password_plaintext)
    self.password_hash = @password.to_s
  end

  def authenticate(password_plaintext)
    return self.password == password_plaintext
  end
end
