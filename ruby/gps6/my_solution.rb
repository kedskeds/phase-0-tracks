# Virus Predictor

# I worked on this challenge [with: Evan Renaud].
# We spent 1 hours on this challenge.

# EXPLANATION OF require_relative
# require_relative will import the data from the specified file 
#that is saved locally. require will import data from Ruby public 
#classes.
#
require_relative 'state_data'

class VirusPredictor
  # initializes a new VirusPredictor instance for a given state and assigns variable attributes
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end

  # runs the predicted_deaths and speed_of_spread of the virus for the instance
  def virus_effects
    predicted_deaths
    speed_of_spread
  end

  private
  
  # bases the number of deaths based on pop density of a given state
  def predicted_deaths
    # predicted deaths is solely based on population density    
    if @population_density >= 200
      number_of_deaths = (@population * 0.4).floor
    elsif @population_density < 50
      number_of_deaths = (@population * 0.05).floor
    else
      increment = (@population_density/50).floor
      number_of_deaths=(@population * (increment * 0.1)).floor
    end

    print "#{@state} will lose #{number_of_deaths} people in this outbreak"

  end
  
  # calculates the number of months it will take for a virus to spread given a pop density in a given state
  def speed_of_spread #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.
    months = 2.5

    if @population_density >= 200
      months = 0.5
    else
      increment = (@population_density/50).floor
      increment.times do
        months -= 0.5
      end
    end
    
    puts " and will spread across the state in #{months} months.\n\n"

  end

end

#=======================================================================

# DRIVER CODE
# initialize VirusPredictor for each state

STATE_DATA.each do |state, data|
  some_state = VirusPredictor.new(state, data[:population_density], data[:population])
  some_state.virus_effects
end

#=======================================================================
# Reflection Section

=begin 

The outer hash uses strings for each key and arrows =>, 
whereas the nested hash uses symbols and colons.

require_relative allows you to import code from another 
file that is stored locally. require works the same way, but
is used to access public Ruby methods.

you can iterate through a hash by either creating a loop
or calling the .each method.

when refactoring virus_effects, the thing that stood out 
the most was the fact that the variables changed 
incrementally through each conditional statement.

concepts that were solidified for me:
- iterating through a hash
- the decision to combine methods vs separating them
- considering the scope of instance variables (release 5)


=end