module ApplicationHelper
	
	def markdown(text)
  @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(no_links: true, hard_wrap: true),
  	 autolink: true, fenced_code_blocks: true, tables: true)
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

# 日志归档
	def archive
		if !Article.all.empty?

		@mintime = Article.first.created_at.strftime('%Y-%m') 
		@maxtime = Article.last.created_at.strftime('%Y-%m') 
		@mintime..@maxtime

		end
	end

end
