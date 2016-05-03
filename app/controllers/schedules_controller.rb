class SchedulesController < ApplicationController

    def index
        @schedules = Schedule.all
    end

    def new

        @schedule = Schedule.new
        # assignShifts()
    end

    def create
        @schedule = Schedule.new schedule_params
        def assignShifts
            if @schedule.timeslots.length < @schedule.users.length
                puts "assignShifts sanity check"
                return nil
            end
            available_officers = @schedule.users # concat more if shifts/officer > 1
            return recursive_backtracking({}, available_officers)
        end

        def recursive_backtracking(assignment, available_officers)
            puts assignment.length
            puts @schedule.timeslots.length
            if assignment.length == @schedule.timeslots.length #not gonna work yet cus each assignment needs to be size 2
                puts "recursive base case"
                return assignment
            end
            puts "before select call"
            temp = select_unassigned_variable(assignment)
            temp.users.each do |f|
                puts "bro"
                if available_officers.include?(f)
                  if assignment[temp]
                      assignment[temp].push(f)
                      available_officers.delete(f)
                  else
                      assignment[temp] = []
                      assignment[temp].push(f)
                      available_officers.delete(f)
                  end
                  new_assignment = recursive_backtracking(assignment, available_officers)
                  if new_assignment != nil
                      return new_assignment
                  end
                  assignment[temp].pop()
                  available_officers.push(f)
                end
            end
            return nil
        end

        def select_unassigned_variable(assignment)
            @schedule.timeslots.each do |f|
                if assignment[f] == nil# change this to assignment[f].length < shifts/user
                    puts "selecting"
                    return f
                end
            end
        end

        @schedule.assignment = assignShifts
        if @schedule.assignment == nil
            @schedule.assignment = {"Error" => []}
        end
        @schedule.save
        redirect_to schedules_path
    end

    private

    def schedule_params
      params.require(:schedule).permit(:timeslot_ids => [], :user_ids => []) # description, shifts/officer
    end




end
