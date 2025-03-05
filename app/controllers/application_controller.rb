class ApplicationController < ActionController::Base
    before_action :load_categories

    private
  
    def load_categories
      @categories = Category.where(parent_id: nil) # Récupérer uniquement les catégories principales
    end
    
end
