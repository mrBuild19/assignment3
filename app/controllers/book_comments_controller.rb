class BookCommentsController < ApplicationController
	def create
		@show_book = Book.find(params[:book_id])
		@book_comment = current_user.book_comments.new(book_comment_params)
		@book_comment.book_id = @show_book.id
		if @book_comment.save
			redirect_to book_path(@show_book)
		else
			@book = Book.new
			render template: "books/show"
		end
	end
	def destroy
		book = Book.find(params[:book_id])
		comment = BookComment.find(params[:id])
		comment.destroy
		redirect_to book_path(book), notice: "successfully delete comment!"
	end

	private
	def book_comment_params
		params.require(:book_comment).permit(:comment)
	end
end
