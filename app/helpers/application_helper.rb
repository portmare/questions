module ApplicationHelper
  def navigation_links
    if current_user
      "#{current_user.name} #{link_to('Выход', destroy_user_session_path(current_user), method: :delete)}".html_safe
    else
      "#{link_to('Регистрация', new_user_registration_path)} / #{link_to('Вход', new_user_session_path)}".html_safe
    end
  end
end
