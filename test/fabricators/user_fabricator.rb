Fabricator(:user) do
  email           { sequence(:email) { |i| "dphaener+#{i}@gmail.com"} }
  first_name      "Greg"
  last_name       "Goforth"
  password        "pa$$word5647389"
end
