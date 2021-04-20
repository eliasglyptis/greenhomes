module ApplicationHelper
  
  def avatar_url(user)
    if user.image?
      user.image
    else
      'avatar.png'
    end
  end

  def project_status(status)
    case status
    when 'Created'
      'is-danger'
    when 'Started'
      'is-info'
    when 'Stopped'
      'is-warning'
    else 
      'is-success'
    end
  end
end
