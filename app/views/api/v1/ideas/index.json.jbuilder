json.data do
  json.array! @category do |category|
    category_name = Category.find_by(id: category.category_id)
    json.id category.id
    json.category category_name.name
    json.body category.body
    json.created_at category.created_at.to_i
  end
end
