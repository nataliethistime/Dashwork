class NoteDecorator < DecoratorBase
  def title(note)
    helpers.truncate note.content, length: 60
  end

  def content(note)
    format note.content, as: :markdown
  end
end
