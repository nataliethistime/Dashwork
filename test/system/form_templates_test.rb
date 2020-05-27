require "application_system_test_case"

class FormTemplatesTest < ApplicationSystemTestCase
  setup do
    @form_template = form_templates(:one)
  end

  test "visiting the index" do
    visit form_templates_url
    assert_selector "h1", text: "Form Templates"
  end

  test "creating a Form template" do
    visit form_templates_url
    click_on "New Form Template"

    fill_in "Name", with: @form_template.name
    click_on "Create Form template"

    assert_text "Form template was successfully created"
    click_on "Back"
  end

  test "updating a Form template" do
    visit form_templates_url
    click_on "Edit", match: :first

    fill_in "Name", with: @form_template.name
    click_on "Update Form template"

    assert_text "Form template was successfully updated"
    click_on "Back"
  end

  test "destroying a Form template" do
    visit form_templates_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Form template was successfully destroyed"
  end
end
