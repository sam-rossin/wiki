class PagesController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :history] 
  
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
    if params[:version] && (params[:version] != @page.contents.first.id.to_s)
      flash.now[:info] = "You are currently editing an older version of the page.
        To edit the newest version 
        #{view_context.link_to('click here', edit_page_path(@page.name))}.".html_safe
    end
    @content = @page.contents.build
    @current = find_content_version(@page)
  end
  
  def show
    @page = current_page
    if params[:version] && (params[:version] != @page.contents.first.id.to_s)
      flash.now[:info] = "You are currently viewing an older version of the page.
        To view the newest version 
        #{view_context.link_to('click here', page_path(@page.name))}.".html_safe
    end
    @current = find_content_version(@page)
  end
  
  def index
    @pages = Page.search(params[:search]).paginate(page: params[:page])
  end
  
  def history
    @page = current_page
    @pages = @page.contents.all.paginate(page: params[:page])
  end
  
  private
    def find_content_version(page)
      if params[:version]
        page.contents.find(params[:version])
      else
        page.contents.first
      end
    end
    
    def pages_params
      params.require(:page).permit(:name, contents_attributes: [:words, :nested])
    end
end
