class ConfiguracaoUsuario < ApplicationRecord
  belongs_to :usuario
  belongs_to :configuracao
end
