json.array! @speakers do |speaker|
  json.id speaker.id
  json.label speaker.name
  json.value speaker.name
  json.honorific speaker.honorific
  json.org_id speaker.organization_id
  json.religion_id speaker.religion_id
end

