class User < ActiveRecord::Base

		before_save :hash_stuff
	

	attr_accessor :password




    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
              uniqueness: { case_sensitive: false } 
    
    validates :password, presence: true, length: { minimum: 4 }, :on => :create



	def authenticated?(pwd)
		self.hashed_password ==
		BCrypt::Engine.hash_secret(pwd, self.salt)
		end


	private

		def hash_stuff
			self.salt = BCrypt::Engine.generate_salt
			self.hashed_password =
			BCrypt::Engine.hash_secret(password, self.salt)
			self.password = nil
		end
end
