class Group < ApplicationRecord
    has_many :user_groups
    has_many :notebooks
end
