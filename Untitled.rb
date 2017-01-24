@types_api = []
id = 1
while id <= 18
  @type = JSON.parse(RestClient.get("https://pokeapi.co/api/v2/type/#{id}/"))

@type["damage_relations"]["no_damage_to"].each do |type|
  @types_api << {type_id: id, weakness_id: Type.find_by(name: type["name"].capitalize).id}
end

@type["damage_relations"]["half_damage_to"].each do |type|
  @types_api << {type_id: id, weakness_id: Type.find_by(name: type["name"].capitalize).id}
end
# @types["damage_relations"]["double_damage_to"]

  # Pokedex.create(type_params)

  # puts "So many Pokemon to load..." if id == 75
  id += 1
end
