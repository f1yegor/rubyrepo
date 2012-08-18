#Если мы возьмем 47, перевернем его и сложим, получится 121 - палиндром.
#Если взять 349 и проделать над ним эту операцию три раза, то тоже получится палиндром:
#    349 + 943 = 1292
#    1292 + 2921 = 4213
#    4213 + 3124 = 7337
#Найдите количество положительных натуральных чисел меньших 13554 таких, что из них нельзя получить палиндром за 50 или менее применений описанной операции.

def palindrom? num
  num=(num.class==String)? num : num.to_s
  result=true
  for i in (0..num.length/2-1)
    result = (num[i]==num[-i-1])
    if result
      next
    else break
    end
  end
  result
end

#puts palindrom? 7337

# i suggest that toggle 1230 is 321, and 1234 is 4321
def toggle number
  number=(number.class!=String) ? number.to_s : number
  number.reverse.to_i
end


ary=[]

def recur number, i
  while  i>0
    k =  number + toggle(number)
    if palindrom? k
        return k
    else
        return recur( k, i-1 )
    end
  end
  return nil
end

for number in (1...12777)
     ary.push recur number, 50
end
pal=[]
 ary.each {|x| pal.push x if !x.nil?}
puts 'array total length',ary.length
puts "array can't get palindrom", ary.length-pal.size
print pal.join(":")
#puts ary