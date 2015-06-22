require_relative 'base_command'

class TurnCommand < BaseCommand

  attr_accessor :degree

  def initialize(rover, degree)
    super rover
    @degree = degree
  end

  def execute
    @rover.turn(@degree)
  end

  def ==(cmd)
    same_command?(cmd) && degree == cmd.degree
  end

end