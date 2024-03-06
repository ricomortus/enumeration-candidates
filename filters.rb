# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
    # Your code Here
    candidates.each do |candidate|
      if candidate.id == id
        return candidate
      end
    end
    nil
end
  
def experienced?(candidate)
  if candidate.years_of_experience >= 2
    return true
  else
    return false
  end
end

def qualified_candidates(candidates)
  # Your code Here
  shortlisted_candidates = []
  candidates.each do |candidate|
    if experienced?(candidate) && github_points(candidate) && ruby_python(candidate) && recent_application(candidate) && legal_adult(candidate)
      shortlisted_candidates.push(candidate)
    end
  end
  shortlisted_candidates  # Return shortlisted_candidates after the loop
end

  
# More methods will go below
def github_points(candidate) 
  candidate[:github_points] >= 100
end

def ruby_python(candidate)
  candidate[:languages]include?('Ruby') || candidate[:languages].include?('Python')
end

def recent_application(candidate)
  candidate[:date_applied] >= 15.days.ago.to_date
end

def legal_adult(candidate)
  candidate[:age] >= 17
end


def reorder_candidates(candidates)
  candidates.sort_by do |candidate|
    [-candidate[:years_of_experience], -candidate[:github_points]]
  end
end
