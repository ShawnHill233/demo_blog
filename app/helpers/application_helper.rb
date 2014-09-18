module ApplicationHelper
	
	def markdown(text)
  @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML,
  	 hard_wrap: true, autolink: true, space_after_headers: true, fenced_code_blocks: true)
  @markdown.render(text)
	end

end
