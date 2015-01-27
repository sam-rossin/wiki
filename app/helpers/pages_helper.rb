module PagesHelper
    #find the current page
    def current_page
      Page.find(params[:id])
    end
end
