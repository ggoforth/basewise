module ApplicationHelper
  def brand_tag(user)
    return "Basewise" unless user
    "Basewise: #{link_to user_name(user), edit_user_path(user)}".html_safe
  end

  def user_name(user)
    return nil unless user
    "#{user.first_name.capitalize} #{user.last_name.capitalize}"
  end

  def session_links(user)
    if user
      return link_to "Logout", logout_path, method: :delete
    end

    content_tag(:span, class: :session_links) do
      link_to("Sign In", signin_path) + " | " + link_to("Sign Up", register_path)
    end
  end
end
