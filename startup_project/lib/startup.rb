require 'byebug'
require "employee"

class Startup

    attr_reader :name, :funding, :salaries, :employees

    def initialize( name, funding, salaries)
        @name=name
        @funding=funding
        @salaries=salaries
        @employees=[]
    end

    def valid_title?(title)
        salaries.include?(title)
    end

    def >(startup)
        @funding>startup.funding
    end

    def hire( name,title)
        if valid_title?(title)
            @employees<<Employee.new(name,title)
            
        else
            raise_error
        end
    end

    def size()
        @employees.length
    end

    def pay_employee(emp_inst)
        if @funding<@salaries[emp_inst.title]
            raise_error
        else
            @funding-=@salaries[emp_inst.title]
            emp_inst.pay(@salaries[emp_inst.title])
        end
    end

    def payday()
        @employees.each { |emp| pay_employee(emp)}
    end

    def average_salary()
        i=0
        @employees.each{ |emp| i+=@salaries[emp.title]}
        i/@employees.length
    end

    def close
        @employees=[]
        @funding=0
    end

    def acquire(startup)
        @funding+=startup.funding
        
        startup.salaries.each do |key,values|
            if !@salaries.include?(key)
                @salaries[key]=values
            end
        end
        @employees.concat( startup.employees )
        startup.close
    end




    
end
