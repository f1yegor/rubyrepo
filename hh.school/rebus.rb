#Дано равенство, в котором цифры заменены на буквы:
#    rqr + rrsw = rssx
#Найдите сколько у него решений, если различным буквам соответсвуют различные цифры.
letters=['r','q','s','w','x']
numbers=(0..9).to_a

for letter in letters
  for number in numbers
   { letter =>number }
  end
end