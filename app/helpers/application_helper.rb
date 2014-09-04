module ApplicationHelper
  def page_name(name)
    content_for(:page_name) {name}
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == 'asc' ? 'desc' : 'asc'
    css_class = nil
    if column == sort_column
      if direction == 'asc'
        css_class = 'glyphicon glyphicon-sort-by-attributes-alt '
      elsif direction == 'desc'
        css_class = 'glyphicon glyphicon-sort-by-attributes '
      end
    end
    content = link_to title, {:sort => column, :direction => direction}
    content + ' ' + content_tag(:span, '', class: css_class)
  end
end
