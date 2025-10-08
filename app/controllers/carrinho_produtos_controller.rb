class CarrinhoProdutosController < ApplicationController
    def index
        carrinho_produtos = Carrinho_produto.all
        render json: carrino_produtos
    end
    
    def show
        begin
        carrino_produto = Carrino_produto.find(params[:id])
        render json: carrino_produto
        rescue ActiveRecord::RecordNotFound
        render json: { error: 'carrino_produto não encontrado' }, status: :not_found
        end
    end
    
    def create
        puts "Parâmetros recebidos: #{params.inspect}" # Para depuração

        carrino_produto = Carrino_produto.new(carrino_produto_params)
        
        if carrino_produto.save
        render json: carrino_produto, status: :created
        else
        render json: carrino_produto.errors, status: :unprocessable_entity
        end
    end

    def update
        begin
        carrino_produto = Carrino_produto.find(params[:id])
        
        if carrino_produto.update(carrino_produto_params)
            render json: carrino_produto
        else
            render json: carrino_produto.errors, status: :unprocessable_entity
        end
        rescue ActiveRecord::RecordNotFound
        render json: { error: 'carrino_produto não encontrado' }, status: :not_found
        end
    end

    def destroy
        begin
        carrino_produto = Carrino_produto.find(params[:id])
        carrino_produto.destroy
        render json: { message: 'carrino_produto deletado com sucesso' }, status: :ok
        rescue ActiveRecord::RecordNotFound
        render json: { error: 'carrino_produto não encontrado' }, status: :not_found
        end
    end
    
    private

    def carrino_produto_params
        params.require(:carrino_produto).permit(:carrinho_id, :produto_id)
    end
end
