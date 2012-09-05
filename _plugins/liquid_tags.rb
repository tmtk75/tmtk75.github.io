module Jekyll
  class RenderTimeTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @text = text
    end
    def render(context)
      "#{@text} #{Time.now}"
    end
  end
  module FooFilters
    def foomomo(input)
      "foo#{input}bar"
    end
  end
end
Liquid::Template.register_tag('render_time', Jekyll::RenderTimeTag)
Liquid::Template.register_filter(Jekyll::FooFilters)

module Jekyll
  module AssetFilter
    def asset_url(input)      
      "http://www.example.com/#{input}?#{Time.now.to_i}"
    end
  end
end
Liquid::Template.register_filter(Jekyll::AssetFilter)
