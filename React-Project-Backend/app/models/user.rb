class User < ApplicationRecord
    has_secure_password
    has_many :user_groups
    has_many :notes
end
