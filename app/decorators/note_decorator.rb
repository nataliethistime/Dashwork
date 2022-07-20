class NoteDecorator < DecoratorBase
  def content(note)
    format note.content, as: :markdown
  end

  def preview(note)
    helpers.truncate note.content, length: 120
  end

  def author(note)
    note.user.decorate :name
  end

  def links(note)
    render partial: 'notes/links', locals: { note: note }
  end

  def tags(note)
    note.tags.collect(&:name).join ', '
  end
end
