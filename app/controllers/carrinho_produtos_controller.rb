class CarrinhoProdutosController < ApplicationController
    def index
        carrinho_produtos = CarrinhoProduto.all
        render json: carrinho_produtos
    end
    
    def show
        begin
        carrinho_produto = CarrinhoProduto.find(params[:id])
        render json: carrinho_produto
        rescue ActiveRecord::RecordNotFound
        render json: { error: 'carrinho_produto não encontrado' }, status: :not_found
        end
    end
    
    def create
        puts "Parâmetros recebidos: #{params.inspect}" # Para depuração

        carrinho_produto = CarrinhoProduto.new(carrinho_produto_params)
        
        if carrinho_produto.save
        render json: carrinho_produto, status: :created
        else
        render json: carrinho_produto.errors, status: :unprocessable_entity
        end
    end

    def update
        begin
        carrinho_produto = CarrinhoProduto.find(params[:id])
        
        if carrinho_produto.update(carrinho_produto_params)
            render json: carrinho_produto
        else
            render json: carrinho_produto.errors, status: :unprocessable_entity
        end
        rescue ActiveRecord::RecordNotFound
        render json: { error: 'carrinho_produto não encontrado' }, status: :not_found
        end
    end

    def destroy
        begin
        carrinho_produto = CarrinhoProduto.find(params[:id])
        carrinho_produto.destroy
        render json: { message: 'carrinho_produto deletado com sucesso' }, status: :ok
        rescue ActiveRecord::RecordNotFound
        render json: { error: 'carrinho_produto não encontrado' }, status: :not_found
        end
    end
    
    private

    def carrinho_produto_params
        params.require(:carrinho_produto).permit(:carrinho_id, :produto_id)
    end
end
