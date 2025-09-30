class UsuariosController < ApplicationController
  def index
    usuarios = Usuario.all
    render json: usuarios
  end
  
  def show
    begin
      usuario = Usuario.find(params[:id])
      render json: usuario
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Usuário não encontrado' }, status: :not_found
    end
  end
  
  def create
    puts "Parâmetros recebidos: #{params.inspect}" # Para depuração

    usuario = Usuario.new(usuario_params)
    
    if usuario.save
      render json: usuario, status: :created
    else
      render json: usuario.errors, status: :unprocessable_entity
    end
  end

  def update
    begin
      usuario = Usuario.find(params[:id])
      
      if usuario.update(usuario_params)
        render json: usuario
      else
        render json: usuario.errors, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Usuário não encontrado' }, status: :not_found
    end
  end

  def destroy
    begin
      usuario = Usuario.find(params[:id])
      usuario.destroy
      render json: { message: 'Usuário deletado com sucesso' }, status: :ok
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Usuário não encontrado' }, status: :not_found
    end
  end
  
  private

  def usuario_params
    params.require(:usuario).permit(:nome, :email, :senha)
  end
end
