def main
  q=Quiz.new
#  q.read( [16,2,3,4,1,6,7,8,5,10,11,12,9,13,14,15] )
   q.read( [11,2,4,7,14,12,9,6,13,15,8,1,3,5,10,16])
#  q.read( [16,2,3,4,5,6,7,8,9,10,11,12,13,14,15,1] )
  puts "initial state = ",q.show,"\n"
#  print "manhatten = ",q.manhatten,"\n"
#  q.data.each{|x| print q.cur_position(x),"\n"}
#  print "\n is solved? = ",q.solved?
#  print "\n",q.how_open
#  print "\n",q.position
#  print "\n",q.solvable?
#=begin
  if q.solvable?
    if q.solved?
      puts "Quiz is solved initially"
    else
      puts "Problem is carring out..."
      is_solved=false
      while (!is_solved)
      q=q.compute
      is_solved = q.solved?
#      print "this step is solve the problem? = ",is_solved,"\n"
      end
      print "Final Stage = ",q.show
    end
  else
      puts "This Quiz is Unsolvable"
  end
#=end
end

class Quiz
  attr_accessor :level,:data, :op
  public
  def compute
        gen=self.change # creating new generation
        modified=choose_best(gen)
        print modified.show,"\n"
      return modified
  end

  def read args
    @data=args
  end

  def initialize level=1
    @level=level
    @data=[]
    @op=""
  end

  def solved?
    @data.each_with_index{|v,k| return false if v!=k+1}
    return true
  end

  def W w=0; @data.each_with_index {|v,k| w+=1 if v!=k+1}; w end

  def solvable?
    e=self.cur_position(16).last
    ni=Array.new
      for i in 0...@data.size
        next if data[i]==16
        trigger=0
        for j in i+1...@data.size
          trigger+=1 if @data[i]>@data[j] & data[j]!=16
        end
        ni << trigger
      end
     summa=0
     ni.each{|x| summa+=x}
     summa+=e
#     print "summa = ",summa,"\n"
    (summa % 2)==0 ? true : false
  end

  def swap wnone,hopen
    ndata=@data.clone
    temp=ndata[wnone-1]; ndata[wnone-1]=ndata[hopen-1];ndata[hopen-1]=temp;
    return ndata
  end

  def change
    generation=Array.new
    self.how_open.each{|x|
        inst=Quiz.new(self.level+1)
        unless (self.op.include?(x.to_s))# & self.op.include?(self.where_none.to_s) )
        inst.read(self.swap(self.where_none?,x))
        inst.op=self.where_none?.to_s+"<>"+x.to_s
        generation << inst
        end
        }
#    generation.each{|x| print "new generation = ",x.show,"\n"}
    return generation
  end

  def f1
    self.level+self.W()
  end

  def where_none?
    return (@data.find_index 16) + 1
  end

  def how_open
    x=self.where_none?
    open=Array.new
        open << x-4 if x>4
        open << x+4 if x<13
        open << x-1 if (x % 4)!=1
        open << x+1 if (x % 4)!=0
    return open
  end

  def req_position element
    col=element % 4
    col=4 if col==0
      case element
        when 1..4
          row=1
        when 5..8
          row=2
        when 9..12
          row=3
        when 13..16
          row=4
      end
    return row,col
  end

  def cur_position element
    cur = (@data.find_index element) + 1
    req_position cur
  end

  def manhatten
    summa=0
    @data.each{|x|
      if x!=16
        row_req=self.req_position(x).first
        col_req=self.req_position(x).last
        row_cur=self.cur_position(x).first
        col_cur=self.cur_position(x).last
        sideone=(row_req-row_cur).abs
        sidetwo=(col_req-col_cur).abs
        summa+=sideone+sidetwo
      end
    }
    return summa
  end

  def show
    @op.to_s+" "+@data.to_s
  end
  def show_matrix
    @data[0..3].to_s+"\n"+@data[4..7].to_s+"\n"+@data[8..11].to_s+"\n"+@data[12..15].to_s+"\n"
  end
end

def choose_best gen          # gen=Array[Quiz1, Quiz2,...]
  if gen.first.instance_of?(Quiz) & gen.last.instance_of?(Quiz)
    score=Array.new
    gen.each{|x| score<<x.f1+x.manhatten}
    min=score.min
    index=score.index(min)
    rindex=score.rindex(min)
    if index==rindex
      return gen.at(index)
    else
      family=Array.new
      indexes=Array.new
      score.each_with_index{|v,i| indexes << i if v==min}
      indexes.each{|x| family<<gen.at(x).compute}
      return choose_best family
    end

  end
#  return result
end

main