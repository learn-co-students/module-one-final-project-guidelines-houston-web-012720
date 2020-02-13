class Keyword < ActiveRecord::Base
    has_many :matches
    has_many :pages, through: :matches
end