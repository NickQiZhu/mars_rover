class BaseCommand
  def initialize(rover)
    @rover = rover
  end

  def same_command?(cmd)
    cmd.class == self.class
  end
end