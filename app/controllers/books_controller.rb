class BooksController < ApplicationController

	before_action :verify_login

	def index
		@books = Book.search(params[:search]).desc
		@books = @books.paginate(:page => params[:page], :per_page => 5)

		respond_to do |format|
			format.html {}
			/format.js {}/
			format.json { render json: @books }
		end
	end

	def new
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)

		if @book.save
			redirect_to books_path
		else
			render :new, status: :unprocessable_entity #422
		end
	end
	
	def destroy
		@book = Book.find(params[:id])

		if @book.destroy
			flash[:notice] = "Successfully deleted book."
		else
			flash[:notice] = "Book was not deleted. Try again later."
		end
		redirect_to books_path
	end

	private

	def book_params
		params.require(:book).permit(:name, :genre, :page_count, :image)
	end

	def verify_login
		unless logged_in?
			flash[:error] = "You have to login"
			redirect_to login_path
		end
	end

end