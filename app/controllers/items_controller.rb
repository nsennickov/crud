class ItemsController < ApplicationController
	def index
		@todos = Item.all
	end


	def create 
		@newTodo = Item.new(todo: params[:item][:todos], isDone: false)
		@newTodo.save
		redirect_to root_path
	end


	def edit
		@todos = Item.all
		@todo = Item.find(params[:id])
	end

	def show

	end

	def update
		@todo = Item.find(params[:id])
		@todo.update(todo: params[:item][:todos], isDone: false)
		redirect_to '/'
	end

	def destroy
		@todo_to_delete = Item.find(params[:id])
		@todo_to_delete.destroy
		redirect_to '/'
	end


end
