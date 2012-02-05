module ApplicationHelper



  def current_ver
    "v0.12 - 'slap happy dinosaur'"
  end

  def get_user_role
    current_user.role_id
  end

  def admin?
    if get_user_role < 10
      true
    else
      false
    end
  end

end
