class Node
    attr_accessor :data, :parent, :rank
    def initialize(data)
        @data = data
        @parent = self
        @rank = 0
    end
    def parent
        @parent
    end
    def parent=(parent)
        @parent = parent;
    end
    def rank
        @rank
    end
    def rank=(rank)
        @rank = rank
    end
end