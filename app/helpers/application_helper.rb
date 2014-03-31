module ApplicationHelper
  def icon_and_string(icon, string)
    "<span class=\"glyphicon glyphicon-#{html_escape icon}\"></span> #{html_escape string}".html_safe
  end
end
