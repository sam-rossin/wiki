class PagesController < ApplicationController
  def new
    @page = Page.new
    @contents = @page.contents.build
  end
  
  def create
    @page = Page.create(pages_params)
    if @page.save
      redirect_to page_url(@page.name)
    else
      redirect_to root_url
    end
  end

  def edit
    @page = current_page
    @content = @page.contents.build
  end
  
  def show
    @show_page = 1
    @page = current_page
  end
  
  private
    def pages_params
      params.require(:page).permit(:name, contents_attributes: [:words, :nested])
    end
end
