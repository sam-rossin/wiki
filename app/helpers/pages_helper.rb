module PagesHelper
    #find the current page
    def current_page
      Page.find_by name: params[:name]
    end
end
