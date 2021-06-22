require 'byebug'
require_relative "room"




class Hotel

    def initialize(name,hash)
        @name=name
        @rooms=Hash.new(0) 
        
        hash.each { |key,val| @rooms[key]=Room.new(val)}
        
    end
    
    def name
        cap=@name
        words=cap.split(' ')
        words.each { |word| word[0]=word[0].upcase}.join(' ')
    end

    def rooms
        @rooms
    end

    def room_exists?(room_name)
        if @rooms.include?(room_name)
            return true
        end
        false
    end

    def check_in(person,room)
        if !room_exists?(room)
            puts 'sorry, room does not exist'

            
        elsif !@rooms[room].full?() 
            
            @rooms[room].add_occupant(person)
            puts 'check in successful'
            
            return false
        elsif
            puts 'sorry, room is full'
            return true
        
        end
    end

    def has_vacancy?()
      
        test=@rooms.keys
        if test.all? { |ele| @rooms[ele].full?()==true }
            return false
        end
        true
    end

    def list_rooms
        test=@rooms.keys
        test.each do |ele|
            puts (ele.to_s+'.*'+@rooms[ele].available_space().to_s)
        end

    end

    

end
