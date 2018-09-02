class Clock
	attr_reader :minute,:second
	#def initialize(minute,second)
	#	@minute=minute
	#	@second=second
	#end
	def +(minutes)
    Clock.new((self.minute += minute) % DAY)
  end
	def self.at(minute,second)
		default_minute = 24
		default_second = 60
		reminder = second/default_second
		second = (default_second+second)%default_second
		minute += reminder
		minute = (default_minute+minute)%default_minute
		@minute_value=minute
		@second_value=second
		end
		def self.to_s
			return "#{@minute_value}:#{@second_value}"
		end
end