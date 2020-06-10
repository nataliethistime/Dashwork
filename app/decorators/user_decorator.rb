class UserDecorator < DecoratorBase
  def name(user)
    if user.first_name.present? && user.last_name.present?
      "#{user.first_name} #{user.last_name}"
    else
      user.first_name.presence || user.email
    end
  end
end
