json.array! @voters do |voter|
  json.id 				voter.id
  json.full_name 	voter.first_name + ' ' + voter.last_name
end