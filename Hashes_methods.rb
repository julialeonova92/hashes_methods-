# hashes_methods

unless File.exists?(ARGV.first) 
  puts "File not found"
  exit
end
  
File.open(ARGV.first) do |f|
  movies=f.map do |line|
    field=line.split("|")
    {title:field[1], year:field[2], country:field[3], date:field[4], genre:field[5], longe:field[6], rating:field[7], director:field[8], actor:field[9]}
  end 

  p movies.sort_by { |hsh| hsh[:longe].to_i }.map{|hsh| hsh[:longe]}.last(5) # 5 самых длинных фильмов.
  p movies.find_all{ |hsh| hsh[:genre].include?("Comedy")}.sort_by {|hsh| hsh[:date]}.map { |hsh| hsh[:title] } #все комедии, отсортированные по дате выхода
  p movies.sort_by {|hsh| hsh[:director]}.map { |hsh| hsh[:director] }.uniq #список всех режиссёров по алфавиту (без повторов!)
  p movies.reject{|hsh| hsh[:country]==("USA")}.size #количество фильмов, снятых не в США.
  p movies.group_by{|hsh| hsh[:director]}.map{|dir, group| [dir, group.size]} #количество фильмов, сгруппированных по режиссёру
end
