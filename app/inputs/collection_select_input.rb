class CollectionSelectInput < SimpleForm::Inputs::CollectionSelectInput
  def input_html_classes
    super.push 'form-control'
  end

  def wrapper_html_classes
    super.push 'form-group'
  end
end
