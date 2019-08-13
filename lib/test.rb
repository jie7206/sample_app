def yeller(str_arr)
  str_arr.map {|s| s.upcase}.join
end

puts yeller %w(m i c k e y)


def random_subdomain
  c = ('a'..'z').to_a + ('A'..'Z').to_a
  c.shuffle[0..7].join
end

puts random_subdomain

def string_shuffle(s)
  s.split("").shuffle.join
end

puts string_shuffle("foobar")
