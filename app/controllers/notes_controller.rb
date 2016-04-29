class NotesController < ApplicationController
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  def index
    @notes = Note.all

    respond_to do |format|
      format.json { render json: @notes }
    end

  end

  def show
    @note = Note.find(params[:id])
    respond_to do |format|
      format.json { render json: @note }
    end
  end

  def create
    @note = Note.new(note_params)
    
    respond_to do |format|
      if @note.save
        format.json { render json: @note, status: :created }
        format.xml { render xml: @note, status: :created }
      else
        format.json { render json: @note.errors, status: :unprocessable_entity }
        format.xml { render xml: @note.errors, status: :unprocessable_entity }
      end
    end
  end
    
  def destroy
    @note = Note.find(params[:id])
    
    respond_to do |format|
      if @note.destroy
        format.json { head :no_content, status: :ok }
        format.xml { head :no_content, status: :ok }
      else
        format.json { render json: @note.errors, status: :unprocessable_entity }
        format.xml { render xml: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    respond_to do |format|
      if @note.update(note_params)
        format.json { head :no_content, status: :ok }
        format.xml { head :no_content, status: :ok }
      else
        format.json { render json: @note.errors, status: :unprocessable_entity }
        format.xml { rednder xml: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def note_params
    params.require(:note).permit(:title, :content)
  end

end
