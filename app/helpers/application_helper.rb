module ApplicationHelper
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
