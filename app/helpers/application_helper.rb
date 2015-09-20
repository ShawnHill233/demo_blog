require "redcarpet"

module ApplicationHelper
	
	def sanitize_topic(body)
    sanitize body, :tags => %w(p br img h1 h2 h3 h4 blockquote pre code b i strong em strike del u a ul ol li span), :attributes => %w(href src class title alt target rel)
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

	def markdown(str, options = {})
    # XXX: the renderer instance should be a class variable

    options[:hard_wrap] ||= false
    options[:class] ||= ''
    assembler = Redcarpet::Render::HTML.new(:hard_wrap => options[:hard_wrap]) # auto <br> in <p>

    renderer = Redcarpet::Markdown.new(assembler, {
      :autolink => true,
      :fenced_code_blocks => true
    })
    content_tag(:div, sanitize(MarkdownConverter.convert(str)), :class => options[:class])
  end

end
