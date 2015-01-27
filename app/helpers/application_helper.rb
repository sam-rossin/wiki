module ApplicationHelper
  #make the properly formatted title
  def full_title(page_title=' ')
    base_title = "Sample Wiki"
    if page_title.blank?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
  
end
