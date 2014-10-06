module ApplicationHelper
  def page_name(name)
    content_for(:page_name) { name }
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

    content = link_to title, sort: column, direction: direction
    content + ' ' + content_tag(:span, '', class: css_class)
  end

  # should probably be combined somehow with get_meeting_links
  def get_obj_name(obj)
    if obj.nil?
      'Not provided'
    else
      obj.name
    end
  end

  # should probably be combined somehow with get_obj_name
  def get_meeting_links(link_text, obj)
    if obj.nil? || obj == ''
      link_text + ' not provided'
    else
      link_to link_text, obj, target: '_blank'
    end
  end
end

