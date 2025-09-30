class Carrinho < ApplicationRecord
belongs_to :usuario
has_many :carrinho_produtos
has_many :produtos, through: :carrinho_produtos

validates :usuario, uniqueness: true
end
