class Usuario < ApplicationRecord
    has_many :enderecos
    has_many :posts
end
