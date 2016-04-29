class SearchController < ApplicationController

	def by_title
		render json: Note.where(title: title_params[:title])
	end

	def by_content
		render json: Note.where(content: content_params[:content])
	end

	private	

	def title_params
		params.permit(:title)
	end

	def content_params
		params.permit(:content)
	end

	def tags_params
		params.permit(:tags)
	end

end
