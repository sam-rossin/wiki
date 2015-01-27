class PagesController < ApplicationController
  def new
    @page = Page.new
    @contents = @page.contents.build
  end
  
  def create
    @page = Page.create(pages_params)
    @page.save
    redirect_to root_url
  end

  def edit
    @page = Page.find(params[:id])
    @content = @page.contents.build
  end
  
  def show
    @page = Page.find(params[:id])
  end
  
  private

    def pages_params
      params.require(:page).permit(:name, contents_attributes: [:words, :nested])
    end
end
