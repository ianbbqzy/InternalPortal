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
            available_officers = []
            (1..@schedule.shifts).each do |n|
              available_officers.concat(@schedule.users) # concat more if shifts/officer > 1
            end
            if @schedule.timeslots.length * @schedule.numOfOfficers > available_officers.length
                puts "assignShifts sanity check"
                return nil
            end
            assignment = {}
            @schedule.timeslots.each do |f|
                assignment[f] = []
            end
            return recursive_backtracking(assignment, available_officers)
        end

        def valid_assignment(assignment)
            puts assignment
            puts "true?"
            assignment.each do |key, value|
                puts "at all?"
                if value.length != @schedule.numOfOfficers
                    return false
                end
            end
            puts "true right"
            return true
        end

        def recursive_backtracking(assignment, available_officers)
            puts assignment.length
            puts @schedule.timeslots.length
            if valid_assignment(assignment) #not gonna work yet cus each assignment needs to be size 2
                puts "recursive base case"
                return assignment
            end
            puts "before select call"
            temp = select_unassigned_variable(assignment)
            if temp == nil
                return nil
            end
            temp.users.shuffle.each do |f|
                puts "bro"
                if available_officers.include?(f) && !assignment[temp].include?(f)
                  if assignment[temp]
                      assignment[temp].push(f)
                      available_officers.delete_at(available_officers.index(f) || available_officers.length)
                  else
                      assignment[temp] = []
                      assignment[temp].push(f)
                      available_officers.delete_at(available_officers.index(f) || available_officers.length)
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
                puts "where am i"
                if assignment[f].length < @schedule.shifts# change this to assignment[f].length < shifts/user
                    puts "selecting"
                    return f
                end
            end
            return nil
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
      params.require(:schedule).permit(:title, :shifts, :numOfOfficers, :timeslot_ids => [], :user_ids => []) # description, shifts/officer
    end

end
