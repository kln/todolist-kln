class TasksController < ApplicationController
  before_action :authenticate_user!
	before_action :set_list
	before_action :set_task, except: :create

	def new
	end

	def create
		@task = @list.tasks.create(tasks_params)
 		respond_to do |format|
      format.html { redirect_to(@list) }
      format.js
    end
	end

	def destroy
		if @task.destroy
			flash[:success] = "Tarefa excluída :)"
		else
			flash[:error] = "Erro ao tentar excluir a tarefa :("
		end

		redirect_to @list
	end

	def completed
		@task.update_attribute(:finished_at, Time.zone.now)
		redirect_to @list, notice: "Boooa! :)"
	end

	def incomplete
		@task.update_attribute(:finished_at, nil)
		redirect_to @list
	end

	private

		def set_task
			@task = @list.tasks.find(params[:id])
		end

	  def set_list
	  	@list = List.find(params[:list_id])
	  end

		def tasks_params
	   	params.require(:task).permit(:description)
	  end
end
