class ConfiguracoesController < ApplicationController
before_action :set_usuario

def show
    @configuracao = @usuario.configuracao || @usuario.create_configuracao
end

def update
    @configuracao = @usuario.configuracao || @usuario.create_configuracao

    if @configuracao.update(configuracao_params)
    redirect_to @usuario, notice: 'Configuração atualizada com sucesso.'
    else
    render :show
    end
end

private

def set_usuario
    @usuario = Usuario.find(params[:usuario_id])
end

def configuracao_params
    params.require(:configuracao).permit(:preferencia_1, :preferencia_2, :tema)
end
end