module HealthGraph
  class FitnessActivitySummary
    include Model
    
    hash_attr_accessor :location, :status, :total_calories, :duration, :start_time, :total_distance, :type, :uri
    
    def initialize access_token, path
      self.access_token = access_token
      response = get path, HealthGraph.accept_headers[:fitness_activity_summary]            
      self.body = response.body
      populate_from_hash! self.body
                 
      self.location = response.headers[:location]
      self.status = response.status
    end
  end  
end