module FuelTank
  def fill_tank(level)
    self.fuel_tank = level
  end

  def fuel_level
    self.fuel_tank
  end

  protected
  attr_accessor :fuel_tank
end

module Debugger
  module ClassMethods
    def debug(log)
      puts "!!!DEBUG: #{log} !!!"
    end
  end

  module InstanceMethods
    def debug(log)
      self.class.debug(log)
    end
    def print_class
      puts self.class
    end
  end

end

class Car
  include FuelTank
  extend Debugger::ClassMethods
  include Debugger::InstanceMethods
  # attr_writer :engine_volume
  # attr_reader :engine_volume, :speed
  attr_accessor :speed, :engine_volume

  @@instances = 0

  def self.instances
    @@instances
  end
  debug 'Start interface'

  class << self
    def description
      puts 'This method belongs to class'
    end
  end

  def initialize(speed = 100, engine_volume = 1.6)
    @@instances += 1
    @speed = speed
    @engine_volume = engine_volume
    self.class.debug 'initialize'
  end

  def start_engine
    puts 'Wroom!'
  end

  def beep
    puts 'beep'
  end
  debug 'End interface'
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

class MotorBike
  include FuelTank
  extend Debugger::ClassMethods
  include Debugger::InstanceMethods
  debug 'Debug motorbike'
end