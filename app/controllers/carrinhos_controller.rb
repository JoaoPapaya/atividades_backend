class CarrinhosController < ApplicationController
    def index
        carrinhos = Carrinho.all
        render json: carrinhos
    end
    
    def show
        begin
        carrinho = Carrinho.find(params[:id])
        render json: carrinho
        rescue ActiveRecord::RecordNotFound
        render json: { error: 'Carrinho não encontrado' }, status: :not_found
        end
    end
    
    def create
        puts "Parâmetros recebidos: #{params.inspect}" # Para depuração

        carrinho = Carrinho.new(carrinho_params)
        
        if carrinho.save
        render json: carrinho, status: :created
        else
        render json: carrinho.errors, status: :unprocessable_entity
        end
    end

    def update
        begin
        carrinho = Carrinho.find(params[:id])
        
        if carrinho.update(carrinho_params)
            render json: carrinho
        else
            render json: carrinho.errors, status: :unprocessable_entity
        end
        rescue ActiveRecord::RecordNotFound
        render json: { error: 'Carrinho não encontrado' }, status: :not_found
        end
    end

    def destroy
        begin
        carrinho = Carrinho.find(params[:id])
        carrinho.destroy
        render json: { message: 'Carrinho deletado com sucesso' }, status: :ok
        rescue ActiveRecord::RecordNotFound
        render json: { error: 'Carrinho não encontrado' }, status: :not_found
        end
    end
    
    private

    def carrinho_params
        params.require(:carrinho).permit(:usuario_id, :quantidadeProduto)
    end
    end
end
