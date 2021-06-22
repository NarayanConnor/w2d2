class Room
    attr_reader :apacity, :occupants, :capacity

    def initialize(number)
        @capacity=number
        @occupants=[]
    end

    def full?()
        if @occupants.length < @capacity
            return false
        end
        true
    end

    def available_space()
        @capacity-@occupants.length
    end

    def add_occupant(str)
        if !full?()
            @occupants<<str
            return true
        end
        false
    end


end
