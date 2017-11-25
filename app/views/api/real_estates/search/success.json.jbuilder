json.real_estates @real_estates, partial: 'real_estate', as: :real_estate

json.meta do
   json.total_pages @real_estates.total_pages
end