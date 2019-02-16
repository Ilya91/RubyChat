class Car
  # attr_writer :engine_volume
  # attr_reader :engine_volume, :speed
  attr_accessor :speed, :engine_volume
  def initialize(speed = 100, engine_volume = 1.6)
    @speed = speed
    @engine_volume = engine_volume
  end

  def start_engine
    puts 'Wroom!'
  end

  def beep
    puts 'beep'
  end

  def stop
    self.speed = 0
  end

  def go
    self.speed
  end

  def current_speed
    puts "Current speed: #{@speed}"
  end
end