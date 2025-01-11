require 'securerandom'

class TriggerGraph
  def initialize(number_vertices)
    @number_vertices = number_vertices.to_i
    @set1 = []
    @set2 = []
    trigger
  end

  def inicialize
    @number_vertices.times do |n|
      @number_vertices.times do |x|
        @set1 << n
        @set2 << x
      end
    end
  end

  def trigger
    3.times do
      print "{"
      maximun_vertice = @number_vertices * @number_vertices
      number = SecureRandom.random_number(maximun_vertice - 1) + 1
      inicialize

      number.times do |x|
        ordered_pair = SecureRandom.random_number(number - x) + x

        if x != number - 1
          print "( #{@set1[ordered_pair]} , #{@set2[ordered_pair]}),"
          @set1[x], @set1[ordered_pair] = @set1[ordered_pair], @set1[x]
          @set2[x], @set2[ordered_pair] = @set2[ordered_pair], @set2[x]
        else
          print "(#{@set1[ordered_pair]}, #{@set2[ordered_pair]})"
        end
      end
      print "}\n"
    end
  end
end

number_vertices = ARGV[0].to_i
TriggerGraph.new(number_vertices)
