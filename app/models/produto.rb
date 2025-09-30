class Produto < ApplicationRecord
  belongs_to :categoria
  has_many :carrinho_produtos
  has_many :carrinhos, through: :carrinho_produtos
end
