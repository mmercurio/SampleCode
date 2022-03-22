# Listing 5.8. Baker and other baking domain classes.

class Cake
  def initialize(batter)
    @batter = batter
    @baked = true
  end
end

class Egg
end

class Flower
end

class Baker
  def bake_cake
    @batter = []
    pour_flower
    add_egg
    stir_batter
    return Cake.new(@batter)
  end

  private

  def pour_flower
    @batter.push(Flower.new)
  end

  def add_egg
    @batter.push(Egg.new)
  end

  def stir_batter
  end
end


