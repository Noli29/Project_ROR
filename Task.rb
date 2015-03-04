class Zad
  def initialize
    @b=Array.new(4){Array.new(4){rand(-10..10)}}

  end

  def ran
    d=Array.new(40) do
      date=rand((Time.new-60*60*24*365)..(Time.new))
      t=rand(-20..45)
      d.strftime("%d.%m")
      date.strftime("%d.%m")+" "+t.to_s
    end

  end

end
