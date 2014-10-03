module ApplicationHelper
	
	def markdown(text)
		renderer = HTMLwithCodeRay.new({
      :hard_wrap => true  
    })

    options = {
      :autolink => true,
      :no_intra_emphasis => true,
      :fenced_code_blocks => true,
      :lax_html_blocks => true,
      :strikethrough => true,
      :superscript => true,
      :tables => true
    }

  	@markdown ||= Redcarpet::Markdown.new(renderer, options)
  	@markdown.render(text)
	end

	class HTMLwithCodeRay < Redcarpet::Render::HTML
		def block_code(code, language)
			CodeRay.scan(code, language).div(:tab_width=>2)
		end
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
