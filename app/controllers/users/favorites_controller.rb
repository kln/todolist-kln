class Users::FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_favorite, only: :destroy

  def index
    @favorites = current_user.favorites
  end

  def destroy
    if @favorite.destroy
      flash[:notice] = "Removido dos favoritos"
    else
      flash[:notice] = "Erro ao tentar remover lista dos favoritos"
    end

    redirect_to public_lists_url
  end

  private

    def set_favorite
      @favorite = current_user.favorites.find_by(list_id: params[:id])
    end

end