# jbuilder gem is part of rails, does not have to be installed separately

# create a json which is an array - elements will be objects with three keys 
json.array! @restaurants do |restaurant|
  json.extract! restaurant, :id, :name, :address
end