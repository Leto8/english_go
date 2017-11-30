json.array! @assignments do |assignment|
  json.extract! assignment, :id, :content, :voice
end
