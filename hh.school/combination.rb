def fact n
  n > 1 ? n*fact(n-1) : 1
end

def combination n,k
  return fact(n)/(fact(k)*fact(n-k))
end

trigger=0
for i in 1...162
  for j in 1...i
    trigger+=1 if combination(i,j) > 1000000
  end
end
puts trigger