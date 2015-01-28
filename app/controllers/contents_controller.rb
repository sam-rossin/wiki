class ContentsController < ApplicationController
  def create
    @page = current_page
    @content = @page.contents.build(contents_params)
    @content.save
    redirect_to page_url(@page.name)
  end

  def destroy
  end
  
  private

    def contents_params
      params.require(:content).permit(:words)
    end
end
