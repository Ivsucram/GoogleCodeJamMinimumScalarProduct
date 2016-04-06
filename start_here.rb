class StartHere

  def read_input(file)
    file = File.read(file).each_line
    @T = file.next.gsub('\n','')
    @T = @T[0,@T.length-1].to_i
    @test_cases = []
    for i in 0...@T
      @test_cases[i] = []
    end
    for i in 0...@T
      @test_cases[i][0] = file.next.gsub('\n','')
      @test_cases[i][0] = @test_cases[i][0][0,@test_cases[i][0].length-1].to_i
      @test_cases[i][1] = file.next.gsub('\n','')
      @test_cases[i][1] = @test_cases[i][1].split(' ').map(&:to_i)
      @test_cases[i][2] = file.next.gsub('\n','')
      @test_cases[i][2] = @test_cases[i][2].split(' ').map(&:to_i)
    end
  end

  def process_it
    @result = []
    for i in 0...@T
      @result[i] = 0
      v1 = @test_cases[i][1].sort do |a,b| b <=> a end
      v2 = @test_cases[i][2].sort do |a,b| a <=> b end
      for j in 0...@test_cases[i][0]
        @result[i] = @result[i] + v1[j]*v2[j]
      end
    end
  end

  def write_output(file)
    file = File.open(file, 'w')
    for i in 0...@result.size
      file.puts('Case #' + (i+1).to_s + ': ' + @result[i].to_s)
    end
  end

  def run_it(input,output)
    time = Time.now
    read_input(input)
    puts Time.now-time
    process_it
    puts Time.now-time
    write_output(output)
    puts Time.now-time
  end

  StartHere.new.run_it('A-large-practice.in','output')
end
