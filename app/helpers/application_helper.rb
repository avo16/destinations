module ApplicationHelper
  def active_class(path)
    if request.path == path
      return 'active'
    else
      return ''
    end
  end

  def toastr_flash
    flash.each_with_object([]) do |(type, message), flash_messages|
      type = 'success' if type == 'notice'
      type = 'error' if type == 'alert'
      text = "toastr.#{type}('#{message}', '', { closeButton: true, progressBar: true })"
      flash_messages << text.html_safe if message
    end.join("\n").html_safe
  end
end
