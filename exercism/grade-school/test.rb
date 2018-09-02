b=Hash.new(0)
b={2=>['zsd','ygsg','xefa']}
b[3]=['scsc']
b[1]=['asas']
b.each {|k,v| b[k]=v.sort}
puts Hash[b.sort]