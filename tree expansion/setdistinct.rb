class CDistinct
  def initialize(size)
    @list_id=[]
    @number=size
    @list_size=[]
    @number.times do |i|
      @list_id.push(i)
    end
    @number.times do |i|
      @list_size.push(1)
    end
    #print @list_id.inspect
  end 
  def search(number)
    return @list_id[number]
  end
  def search_speed(number)
    index=number
    #puts "Hola mundo"
    #print @list_id.inspect
    while index!=@list_id[index]
      index=@list_id[index]
    end
    return index
  end 
  def union_speedQ(numberA,numberB)
    root_A=search_speed(numberA)
    root_B=search_speed(numberB)
    if root_A!=root_B
      if @list_size[root_A] <  @list_size[root_B]
        @list_id[root_A]=root_B
        @list_size[root_A]=@list_size[root_B]+@list_size[root_A]
      else
        @list_id[root_B]=root_A
        @list_size[root_B]=@list_size[root_B]+@list_size[root_A]
      end 
      @number=@number-1
    end
  end
  def union(numberA, numberB)
    valueA=search(numberA)
    valueB=search(numberB)
    if valueA!=valueB
      @list_id.times do |i|
        @list_id[i]=valueB
        @number=@number-1
      end
    end
    
  end
  def connect(valueA,valueB)
    return search(A)==search(valuaB)
  end 
  def number 
    puts @list_id
    return @number
  end
end