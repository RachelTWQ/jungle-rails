class User < ActiveRecord::Base
    has_secure_password

    has_many :reviews

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true
    validates :email, uniqueness: { case_sensitive: false }
    validates :password, presence: true
    validates :password, length: { minimum: 3 }
    validates :password_confirmation, presence: true
    validates :password_confirmation, length: { minimum: 3 }
    validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

    def authenticate_with_credentials(email, password)
        user = User.find_by(email: email.downcase)
        user && user.authenticate(password)
    end
end
