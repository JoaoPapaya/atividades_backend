class Usuario < ApplicationRecord
has_one :carrinho
has_many :enderecos
has_many :posts
has_one :configuracao
end
