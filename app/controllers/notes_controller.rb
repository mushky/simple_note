class NotesController < ApplicationController
  before_action :set_search   
	before_action :authenticate_user!

  def index
    @q = current_user.notes.ransack(params[:q])
    @pagy, @notes = pagy(@q.result(distinct: true).order("updated_at DESC"), items: 20)    
  end    

  def new
  	@note = Note.new
  end

  def show
  	@note = current_user.notes.find(params[:id])
  end

  def edit
  	@note = current_user.notes.find(params[:id])
  end

  def delete
  	@note = current_user.notes.find(params[:id])
  end

  def create
  	@note = current_user.notes.new(note_params)
  	if @note.save
  		redirect_to notes_path
  	else
  		render 'new'
  	end
  end

  def update
  	@note = current_user.notes.find(params[:id])
  	if @note.update_attributes(note_params)
  		redirect_to notes_path
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@note = current_user.notes.find(params[:id])
  	@note.destroy

  	redirect_to notes_path
  end

  private
    def set_search
      @q = Note.search(params[:q])
    end

	  def note_params
	    params.require(:note).permit(:title, :description, :tags)
	  end
end
