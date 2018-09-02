class Array
  def keep
    each_with_object([]) do |elem, res|
      res << elem if yield elem
    end
  end

  def discard(&block)
    self - keep(&block)
  end
end