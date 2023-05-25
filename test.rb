class Pizza
  @@count = 0
  @@fail_count = 0

  def initialize(d, ingredients)
    if d == 25 || d == 50
      @d = d
      @ingredients = ingredients
      @@count += 1
      @number = @@count
    else
      @d = 0
      @ingredients = []
      @number = 0
      @@fail_count += 1
    end
  end

  def description
    if @d != 0
      "Піца № #{@number} (діагональ = #{@d}) містить [#{@ingredients.join(', ')}]."
    else
      "Піца № 0 (діагональ = 0) містить []."
    end
  end

  def self.failInstance
    @@fail_count
  end
end