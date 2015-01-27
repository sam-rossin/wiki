class ContentsController < ApplicationController
  def create
    page = Page.find(params[:id])
    @content = page.contents.build(contents_params)
    @content.save
    redirect_to root_url
  end

  def destroy
  end
  
  private

    def contents_params
      params.require(:content).permit(:words)
    end
end
