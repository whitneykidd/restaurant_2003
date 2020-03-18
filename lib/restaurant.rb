class Restaurant
  attr_reader :opening_time, :name, :dishes
  def initialize(opening_time, name)
    @opening_time = opening_time
    @name = name
    @dishes = []
  end

  def closing_time(open_hours)
    hours = (@opening_time.to_i + open_hours)
    "#{hours}:00"
  end

  def add_dish(dish)
    @dishes << dish
  end

  def open_for_lunch?
    @opening_time.to_i < 12 ? true : false
  end

  def menu_dish_names
    @dishes.map { |dish| dish.upcase }
  end

  def announce_closing_time(hours_open)
    closing_time_integer = @opening_time.to_i + hours_open
    if closing_time_integer < 12
      "#{name} will be closing at #{closing_time_integer}:00AM"
    else closing_time_integer >= 12
      pm_close_time = closing_time_integer - 12
      "#{name} will be closing at #{pm_close_time}:00PM"
    end
  end
end
