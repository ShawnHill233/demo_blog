module ApplicationHelper
	
	def markdown(text)
  @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML,
  	 hard_wrap: true, autolink: true, space_after_headers: true, fenced_code_blocks: true)
  @markdown.render(text)
	end

  # Returns the full title on a per-page basis.
	def full_title(page_title)
		base_title = "Shawn's Blog"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end

end
