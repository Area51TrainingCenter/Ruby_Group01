class Bomb

  def initialize
    7.downto(1) do |i|
      puts "Bomb countdown: T - #{i}"
      sleep 0.7
    end    

    puts
    puts " Booom! ".center(50, "*")
    
  end

end

Bomb.new
