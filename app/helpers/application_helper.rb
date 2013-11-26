module ApplicationHelper
 
  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-error", alert: "alert-warning", notice: "alert-info" }[flash_type] || flash_type.to_s
  end
 
  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do 
        concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
        concat message 
      end)
    end
    nil
  end
 
   def markdown(content)
    options = {
      autolink: true,
      space_after_headers: true,
      fenced_code_blocks: true
    }  
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, options)
    @markdown.render(content)
  end
  # def markdown(text)
  #   renderer = Redcarpet::Render::HTML.new
  #   extensions = {fenced_code_blocks: true}
  #   redcarpet = Redcarpet::Markdown.new(renderer, extensions)
  #   (redcarpet.render text).html_safe
  # end

end