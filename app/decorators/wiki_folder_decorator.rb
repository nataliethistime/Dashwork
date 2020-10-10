class WikiFolderDecorator < DecoratorBase
  def name_link(wiki_folder)
    helpers.link_to wiki_folder.name, routes.wiki_folder_path(wiki_folder)
  end
end
