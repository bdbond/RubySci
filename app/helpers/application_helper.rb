module ApplicationHelper



  def current_ver
    "v0.16 - 'graffasaurus maximus' rev2"
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
