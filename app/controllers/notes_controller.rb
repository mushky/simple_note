class NotesController < ApplicationController
	before_action :authenticate_user!
	
  def index
  	@notes = Note.all.order("created_at DESC")
  end

  def new
  	@note = Note.new
  end

  def show
  	@note = Note.find(params[:id])
  end

  def edit
  	@note = Note.find(params[:id])
  end

  def delete
  	@note = Note.find(params[:id])
  end

  def create
  	@note = Note.new(note_params)
  	if @note.save
  		redirect_to notes_path
  	else
  		render 'new'
  	end
  end

  def update
  	@note = Note.find(params[:id])
  	if @note.update(note_params)
  		redirect_to @note
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@note = Note.find(params[:id])
  	@note.destroy

  	redirect_to notes_path
  end

  private
	  def note_params
	    params.require(:note).permit(:title, :description)
	  end
end
