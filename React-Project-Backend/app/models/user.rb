class User < ApplicationRecord
    has_many: user_groups
    has_many: notes 
end
