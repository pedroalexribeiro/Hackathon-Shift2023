module ApplicationHelper

  def freelancer_signed_in?
    cookies[:logedin].present?
  end
end
