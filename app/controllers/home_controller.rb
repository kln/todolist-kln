class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @public_lists = List.last_public_lists
  end

  def public_lists
    @public_lists = List.publics.paginate(:page => params[:page], :per_page => 6)
  end

end