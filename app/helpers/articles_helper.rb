# frozen_string_literal: true

module ArticlesHelper
  def link_thumbnailer(link)
    LinkThumbnailer.generate(link)
  end
end
