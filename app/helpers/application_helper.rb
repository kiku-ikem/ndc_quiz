module ApplicationHelper
  def bootstrap_class_for(flash_type)
    case flash_type.to_sym
    when :notice
      "success"  # flash[:notice] -> alert-success
    when :alert
      "danger"   # flash[:alert]  -> alert-danger
    else
      flash_type.to_s
    end
  end
end
