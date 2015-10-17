class ListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def show
    @list ||= List.find_by(id: params[:id], opened: true)
  end

  def new
    @list = List.new
  end

  def edit
  end

  def create
    @list = current_user.lists.new(list_params)

    if @list.save
      redirect_to @list, notice: 'Lista de tarefas criada com sucesso.'
    else
      render :new
    end
  end

  def update
    if @list.update(list_params)
      redirect_to @list, notice: 'Lista atualizada.'
    else
      render :edit
    end
  end

  def favorite
    @favorite_list = Favorite.new(list_id: params[:id], user: current_user)

    if @favorite_list.save!
      flash[:notice] = "A lista foi adicionada aos favoritos"
    else
      flash[:error] = "Um erro aconteceu ao tentar adicionar a lista aos favoritos :("
    end
    redirect_to public_lists_url
  end

  def destroy
    @list.destroy
    redirect_to root_url, notice: 'Lista excluída.'
  end

  private
    def set_list
      @list = current_user.lists.find_by_id(params[:id])
    end

    def list_params
      params.require(:list).permit(:title, :opened)
    end
end
