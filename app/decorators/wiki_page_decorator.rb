class WikiPageDecorator < DecoratorBase
  def title_link(wiki_page)
    helpers.link_to wiki_page.title, routes.wiki_page_path(wiki_page)
  end

  def content(wiki_page)
    format wiki_page.content, as: :markdown
  end
end
