class User < ApplicationRecord
    has_many :reviews
    has_many :photographers, through: :reviews 
    has_secure_password

    validates :username, presence: true, uniqueness: true 
    #validates :email, presence: true 
 
    def self.find_or_create_by_omniauth(auth)
        user = User.find_by(uid: auth['uid'])

        if user.nil?
            user = User.create(username: auth['info']['nickname'], password: SecureRandom.hex, uid: auth['uid'])
        elsif user.uid.nil?
            user.update(uid:auth['uid'])
        end 
        user 
    end 
    
end 