class ApplicationController < ActionController::Base
  before_action :set_search   
	
	private
    def set_search
      @q = Note.search(params[:q])
    end	
end
