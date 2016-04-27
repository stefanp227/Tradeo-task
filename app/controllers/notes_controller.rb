class NotesController < ApplicationController

  def index
    @notes = Note.all
  end

	def new
    @note = Note.new
  end

  def show
    @note = Note.find(params[:id])
  end

  def create

  end

  def destroy

  end

  def edit

  end

  def update

  end

  private

  def note_params
    params.require(:note).permit(:title, :content)
  end

end
