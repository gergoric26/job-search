class PosaosController < ApplicationController
	before_action :find_job, only: [:show, :edit, :update, :destroy]

	def index
		if params[:category].blank?
			@posaos = Posao.all.order("created_at DESC")
		else
			@category_id = Category.find_by(name: params[:category]).id
			@posaos = Posao.where(category_id: @category_id).order("created_at DESC")
		end
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
		params.require(:posao).permit(:title, :description, :company, :url, :category_id)		
	end

	def find_job
		@posao = Posao.find(params[:id])
	end

end
