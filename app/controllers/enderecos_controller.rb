class EnderecosController < ApplicationController
  def index
    enderecos = Endereco.all

    render json: enderecos
  end
  
  def show
    endereco = Endereco.find(params[:id])

    render json: endereco
  end
  
  def create
    endereco = Endereco.new(endereco_params)
    if endereco.save
      render json: endereco, status: created
    else
      render json: endereco.errors, status: :unprocessable_entity
    end
  end

  def update
    endereco = Endereco.find(params[:id])
    if endereco.update(endereco_params)
      render json: endereco
    else
      render json: endereco.errors, status: :unprocessable_entity
    end
  end

  def destroy
    endereco = Endereco.find(params[:id])
    endereco.destroy
  end
  
  def endereco_params
    params.require(:endereco).permit(:rua, :cidade, :cep, :usuario)
  end
end
