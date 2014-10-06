module NavigationHelpers
  def path_to(page_name)
    case page_name

    when /the home page/
      root_path
    # Add more page name => path mappings here
    else
      path = match_rails_path_for(page_name)
      if path
        path
      else
        fail "Can't find mapping from \"#{page_name}\" to a path.\n" \
        'Now, go and add a mapping in features/support/paths.rb'
      end
    end
  end

  def match_rails_path_for(page_name)
    return unless page_name.match(/the (.*) page/)
    send "#{Regexp.last_match[1].gsub(' ', '_')}_path" rescue nil # rubocop:disable Style/RescueModifier, Metrics/LineLength
  end
end

World(NavigationHelpers)

