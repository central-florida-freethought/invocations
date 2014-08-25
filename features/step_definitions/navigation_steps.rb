When /^I visit (.+)$/  do |page_name|
  visit path_to(page_name)
end

When /^I go to the locality page for (.*)$/i do |locality_name|
  locality = Locality.where(name: locality_name).first
  visit locality_path(locality)
end
