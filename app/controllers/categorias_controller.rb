class CategoriasController < ApplicationController
    def index
        categorias = Categoria.all
        render json: categorias
    end
    
    def show
        begin
        categoria = Categoria.find(params[:id])
        render json: categoria
        rescue ActiveRecord::RecordNotFound
        render json: { error: 'Categoria não encontrada' }, status: :not_found
        end
    end
    
    def create
        puts "Parâmetros recebidos: #{params.inspect}" # Para depuração

        categoria = Categoria.new(categoria_params)
        
        if categoria.save
        render json: categoria, status: :created
        else
        render json: categoria.errors, status: :unprocessable_entity
        end
    end

    def update
        begin
        categoria = Categoria.find(params[:id])
        
        if categoria.update(categoria_params)
            render json: categoria
        else
            render json: categoria.errors, status: :unprocessable_entity
        end
        rescue ActiveRecord::RecordNotFound
        render json: { error: 'Categoria não encontrada' }, status: :not_found
        end
    end

    def destroy
        begin
        categoria = Categoria.find(params[:id])
        categoria.destroy
        render json: { message: 'Categoria deletado com sucesso' }, status: :ok
        rescue ActiveRecord::RecordNotFound
        render json: { error: 'Categoria não encontrads' }, status: :not_found
        end
    end
    
    private

    def categoria_params
        params.require(:categoria).permit(:nome)
    end
end
