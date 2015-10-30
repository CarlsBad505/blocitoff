module ApplicationHelper
  def title_for(page_title)
    page_title.empty? ? "BlocItOff" : page_title
  end
end
