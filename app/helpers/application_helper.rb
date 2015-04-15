module ApplicationHelper

	# Retourner un titre basé sur la page.
	def title
		base_title = t("title.application")
		if @title.nil?
			base_title
		else
			"#{base_title} | #{@title}"
		end
	end

	def subtitle
		if @subtitle.nil?
			""
		else
			@subtitle
		end
	end
  
  def mark_down(text)
    render_options = {
      # will remove from the output HTML tags inputted by user 
      filter_html:     true,
      # will insert <br /> tags in paragraphs where are newlines 
      # (ignored by default)
      hard_wrap:       true, 
      # hash for extra link options, for example 'nofollow'
      link_attributes: { rel: 'nofollow' }
      # more
      # will remove <img> tags from output
      # no_images: true
      # will remove <a> tags from output
      # no_links: true
      # will remove <style> tags from output
      # no_styles: true
      # generate links for only safe protocols
      # safe_links_only: true
      # and more ... (prettify, with_toc_data, xhtml)
    }
    renderer = Redcarpet::Render::HTML.new(render_options)

    extensions = {
      #will parse links without need of enclosing them
      autolink:           true,
      # blocks delimited with 3 ` or ~ will be considered as code block. 
      # No need to indent.  You can provide language name too.
      # ```ruby
      # block of code
      # ```
      fenced_code_blocks: true,
      # will ignore standard require for empty lines surrounding HTML blocks
      lax_spacing:        true,
      # will not generate emphasis inside of words, for example no_emph_no
      no_intra_emphasis:  true,
      # will parse strikethrough from ~~, for example: ~~bad~~
      strikethrough:      true,
      # will parse superscript after ^, you can wrap superscript in () 
      superscript:        true
      # will require a space after # in defining headers
      # space_after_headers: true
    }
    Redcarpet::Markdown.new(renderer, extensions).render(text).html_safe
  end
  
  def element_color(element, color)
    if color != nil and element != nil
      return element + "-" + color
    else
      return ""
    end 
  end
  
  def translate_label(model, attribute, lang)
    return model.human_attribute_name(attribute) + " (" + t("locale_name." + lang.to_s) + ")"
  end
  
  def flag(lang)
    base = "famfamfam-flag-"
    if lang == :en
      return base + "gb"
    end
    return base + lang.to_s
  end
  
  def form_error_messages!(resource)
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
                      :count => resource.errors.count,
                      :resource => resource.class.model_name.human.downcase)

    html = <<-HTML
    <div class="alert alert-dismissable alert-warning">
    <button type="button" class="close" data-dismiss="alert">×</button>
    <h4>#{sentence}</h4>
    <ul>#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end
  
  def form_error_messages?(resource)
    resource.errors.empty? ? false : true
  end
  
end

