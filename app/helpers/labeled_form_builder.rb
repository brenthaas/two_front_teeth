class LabeledFormBuilder < ActionView::Helpers::FormBuilder
  def text_field(attribute, options={})
    options[:class] ||= "#{attribute.to_s}'"
    @template.content_tag :div, class: "field" do
      label(attribute, attribute.to_s.titleize) + super
    end
  end
end