#Рассмотрим спираль, в котрой, начиная с 1 в центре, последовательно расставим числа по часовой стрелке,
#    пока не получится спираль 5 на 5
#    21 22 23 24 25
#    20  7  8  9 10
#    19  6  1  2 11
#    18  5  4  3 12
#    17 16 15 14 13
#Можно проверить, что сумма всех чисел на диагоналях равна 101.
#Чему будет равна сумма чисел на диагоналях, для спирали размером 1091 на 1091?

#data=(1..1091**2).to_a
data=(1..1169**2).to_a
sum=data[0]
link=0
start=8
 step=2
    while !(start>data.length-1)
    sum+=data[link+1*step]+data[link+2*step]+data[link+3*step]+data[link+4*step]
    puts sum
    step+=2
    link=start
    start+=4*step
    end
print 'sum of diagonal elements = ',sum