require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test 'icon_for' do
    assert_equal '<span class="icon"><i class="fas fa-edit"></i></span>', icon_for(:edit)
  end

  test 'class_names' do
    assert_equal 'foo baz', class_names(foo: true, bar: false, baz: true)
  end
end
