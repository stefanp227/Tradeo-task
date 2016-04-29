class TagsController < ApplicationController
	protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

	def index
		@tags = Note.find(params[:note_id]).tags

		respond_to do |format|
			format.json { render json: @tags}
		end
	end

	def show
		@tag = Tag.find(params[:id])
	end

	def edit
		@tag = Tag.find(params[:id])
	end

	def create
		@tag = Tag.new(note_id: note_id_param, name: tag_params[:name])
    debugger
		respond_to do |format|
      if @tag.save
        format.json { render json: @tag, status: :created }
        format.xml { render xml: @tag, status: :created }
      else
        format.json { render json: @tag.errors, status: :unprocessable_entity }
        format.xml { render xml: @tag.errors, status: :unprocessable_entity }
      end
    end
	end

	def update
		respond_to do |format|
      if @tag.update(tag_params)
        format.json { render json: @tag, status: :ok }
        format.xml { render xml: @tag, status: :ok }
      else
        format.json { render json: @tag.errors, status: :unprocessable_entity }
        format.xml { render xml: @tag.errors, status: :unprocessable_entity }
      end
    end
	end

	def destroy
		@tag = Tag.find(params[:id])
		
		respond_to do |format|
      if @tag.destroy
        format.json { head :no_content, status: :ok }
        format.xml { head :no_content, status: :ok }

      else
        format.json { render json: @tag.errors, status: :unprocessable_entity }
        format.xml { render xml: @tag.errors, status: :unprocessable_entity }
      end
    end
	end

	private

	def tag_params
		params.require(:tag).permit(:name)
	end

	def note_id_param
		params.require(:note_id)
	end

end