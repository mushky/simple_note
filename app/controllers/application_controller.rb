class ApplicationController < ActionController::Base
  include Pagy::Backend

  before_action :set_search   
	
	private
    def set_search
      @q = Note.search(params[:q])
    end	
end
