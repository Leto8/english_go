json.array! @assignment do |assignment|
  json.extract! assignment, :id, :content, :voice
end
