module ApplicationHelper

  def bootstrap_class_for(name)
    {
        success: "alert-succes",
        error: "alert-danger",
        alert: "alert-warning",
        danger: "alert-danger",
        notice: "alert-info",
    }[name.to_sym] || name
  end
end
