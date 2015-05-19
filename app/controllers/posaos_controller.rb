class PosaosController < ApplicationController
	before_action :find_job, only: [:show, :edit, :update, :destroy]

	def index
		@posaos = Posao.all.order("created_at DESC")
	end

	def show
	end

	def new
		@posao = Posao.new
	end

	def create
		@posao = Posao.new(posaos_params)

		if @posao.save
			redirect_to @posao
		else
			render "New"
		end
	end

	def edit

	end

	def update
		if @posao.update(posaos_params)
			redirect_to @posao
		else
			render "Edit"
		end
	end

	def destroy
		@posao.destroy
		redirect_to root_path
	end

	private

	def posaos_params
		params.require(:posao).permit(:title, :description, :company, :url)		
	end

	def find_job
		@posao = Posao.find(params[:id])
	end

end
