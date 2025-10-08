class ProdutosController < ApplicationController
    def index
        produtos = Produto.all
        render json: produtos
    end
    
    def show
        begin
        produto = Produto.find(params[:id])
        render json: produto
        rescue ActiveRecord::RecordNotFound
        render json: { error: 'produto não encontrado' }, status: :not_found
        end
    end
    
    def create
        puts "Parâmetros recebidos: #{params.inspect}" # Para depuração

        produto = Produto.new(produto_params)
        
        if produto.save
        render json: produto, status: :created
        else
        render json: produto.errors, status: :unprocessable_entity
        end
    end

    def update
        begin
        produto = Produto.find(params[:id])
        
        if produto.update(produto_params)
            render json: produto
        else
            render json: produto.errors, status: :unprocessable_entity
        end
        rescue ActiveRecord::RecordNotFound
        render json: { error: 'produto não encontrado' }, status: :not_found
        end
    end

    def destroy
        begin
        produto = Produto.find(params[:id])
        produto.destroy
        render json: { message: 'produto deletado com sucesso' }, status: :ok
        rescue ActiveRecord::RecordNotFound
        render json: { error: 'produto não encontrado' }, status: :not_found
        end
    end
    
    private

    def produto_params
        params.require(:produto).permit(:nome, :descricao, :preco, :categoria_id)
    end
end
