class BeerSong
  def verses(start = 99, stop = 0)
    start.downto(stop).map do |verse_num|
      verse(verse_num)
    end.join("\n")
  end
  alias sing verses

  def verse(num)
    [first_line(num), second_line(num)].join("\n") + "\n"
  end

  def lyrics
  	verses(99,0)
  end

  private

  def first_line(num)
    "#{quantity(num).capitalize} #{container(num)} of beer on the wall, "\
    "#{quantity(num)} #{container(num)} of beer."
  end

  def second_line(num)
    return last_line if num == 0
    "Take #{change_number(num)} down and pass it around, #{quantity(num - 1)} "\
      "#{container(num - 1)} of beer on the wall."
  end

  def last_line
    'Go to the store and buy some more, 99 bottles of beer on the wall.'
  end

  def container(num)
    num == 1 ? 'bottle' : 'bottles'
  end

  def quantity(num)
    num == 0 ? 'no more' : num.to_s
  end

  def change_number(num)
    num == 1 ? 'it' : 'one'
  end
end