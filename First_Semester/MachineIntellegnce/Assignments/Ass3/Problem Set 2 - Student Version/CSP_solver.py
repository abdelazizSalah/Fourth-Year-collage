from typing import Any, Dict, List, Optional
from CSP import Assignment, BinaryConstraint, Problem, UnaryConstraint
from helpers.utils import NotImplemented
import copy

# This function should implement forward checking
# The function is given the problem, the variable that has been assigned and its assigned value and the domains of the unassigned values
# The function should return False if it is impossible to solve the problem after the given assignment, and True otherwise.
# In general, the function should do the following:
#   - For each binary constraints that involve the assigned variable:
#       - Get the other involved variable.
#       - If the other variable has no domain (in other words, it is already assigned), skip this constraint.
#       - Update the other variable's domain to only include the values that satisfy the binary constraint with the assigned variable.
#   - If any variable's domain becomes empty, return False. Otherwise, return True.
# IMPORTANT: Don't use the domains inside the problem, use and modify the ones given by the "domains" argument 
#            since they contain the current domains of unassigned variables only.
def forward_checking(problem: Problem, assigned_variable: str, assigned_value: Any, domains: Dict[str, set]) -> bool:
    # NotImplemented()
    for constraint in problem.constraints:
        if not isinstance(constraint, BinaryConstraint):
                continue 
            
        if(assigned_variable in constraint.variables): #check as forward checking if the constraint is binary and the variable to assign is in the constraint
            # check if the constraint is binary and the assigned variable is in the constraint in order to check withing the constraints that involve the assigned variable
            other_variable = constraint.get_other(assigned_variable) # get the other variable in the constraint besides the assigned variable
            possible_Values = [] # create a list to store the accepted values to replace them in the domain of the other variable
            if domains.get(other_variable) != None: # check if the other variable has a domain 
                for value in domains[other_variable]: # check each value in the domain of the other variable 
                    new_dict = {assigned_variable: assigned_value, other_variable: value} # create a dictionary with the assigned variable and its value and the other variable and its value
                    if constraint.is_satisfied(new_dict): # check if the dictionary is consistent with the constraints 
                        possible_Values.append(value) # if yes, add the value to the list of accepted values
                domains[other_variable] = set(possible_Values) # update the domain of the other variable to be the list of accepted values that implicitly removes the values that are not consistent with the constraints
                if len(domains[other_variable]) == 0:  # if the domain is empty, return false, no solution
                    return False 
    return True

# This function should solve CSP problems using backtracking search with forward checking.
# The variable ordering should be decided by the MRV heuristic.
# The value ordering should be decided by the "least restraining value" heurisitc.
# Unary constraints should be handled using 1-Consistency before starting the backtracking search.
# This function should return the first solution it finds (a complete assignment that satisfies the problem constraints).
# If no solution was found, it should return None.
# IMPORTANT: To get the correct result for the explored nodes, you should check if the assignment is complete only once using "problem.is_complete"
#            for every assignment including the initial empty assignment, EXCEPT for the assignments pruned by the forward checking.
#            Also, if 1-Consistency deems the whole problem unsolvable, you shouldn't call "problem.is_complete" at all.
def solve(problem: Problem) -> Optional[Assignment]:
    # NotImplemented()
    if one_consistency(problem): # check if the problem is 1-consistent 
        return backtracking_searching(problem, {},problem.domains) # call the backtracking_searching function to solve the problem, even if it passes through endpoint then backtracking_searching to choose another variable
    else:
        return None # if the problem is not 1-consistent, then no solution

def backtracking_searching(problem: Problem, assignment: Assignment,domains:Dict[str, set]) -> Optional[Assignment]:
    
    if problem.is_complete(assignment) : # check if the assignment of this variable is complete
        return assignment # if it is complete, return the assignment of varaible, to specific value

    var = minimum_remaining_values(problem, domains) # don't get random variable, get the variable with the minimum remaining values
    values = least_restraining_values(problem, var, domains) # get the values of the variable with the least restraining values
    for value in values: # check each value in the domain of the variable with the least restraining values
        assignment[var] = value  # assign the variable to the value
        domain_after_assign=copy.deepcopy(domains)  # create a copy of the domain of the variable to assign, use deepcopy to avoid changing the original domain
        # delete the assigned value from the dictionary
        domain_after_assign.pop(var) 

        if forward_checking(problem, var, value, domain_after_assign): # check if the value is consistent with the constraints of the variable
            result = backtracking_searching(problem, assignment,domain_after_assign) #backtracking_searching to the next variable to assign 
            if result is not None: # if the result is not None, then the problem is solved, return the result
                return result
            assignment[var] = None # if the result is None, then backtracking_searching to the previous variable to assign
    return None


# This function should return the domain of the given variable order based on the "least restraining value" heuristic.
# IMPORTANT: This function should not modify any of the given arguments.
# Generally, this function is very similar to the forward checking function, but it differs as follows:
#   - You are not given a value for the given variable, since you should do the process for every value in the variable's
#     domain to see how much it will restrain the neigbors domain
#   - Here, you do not modify the given domains. But you can create and modify a copy.
# IMPORTANT: If multiple values have the same priority given the "least restraining value" heuristic, 
#            order them in ascending order (from the lowest to the highest value).
# IMPORTANT: Don't use the domains inside the problem, use and modify the ones given by the "domains" argument 
#            since they contain the current domains of unassigned variables only.
def least_restraining_values(problem: Problem, variable_to_assign: str, domains: Dict[str, set]) -> List[Any]:
    '''
    Description:
        We should select the value which will leave the most choices for the neighbors
    Algo:
        1. for each value in the domain of the variable do
            2. create a copy of the domains
            3. for each binary constraint that involve the assigned variable do
                4. get the other involved variable
                5. if the other variable has no domain, skip this constraint
                6. update the other variable's domain to only include the values that satisfy the binary constraint with the assigned variable
            7. if any variable's domain becomes empty, return False
            8. otherwise, return True
            9. sort the values based on the number of choices
            10. return the values
    '''
    
    remaining_candidates=[] # create a list to store tuple of (values that removes values from other variables , the number of removed values)
    values = domains[variable_to_assign] # get the domain of the variable to assign
    for value in values:  # check each value in the domain of the variable to assign
        removed_values = 0 # create a variable to store the number of removed values, initially 0
        for constraint in problem.constraints: # check each constraint in the problem 
            if not isinstance(constraint, BinaryConstraint):
                continue 
            
            if(variable_to_assign in constraint.variables): #check as forward checking if the constraint is binary and the variable to assign is in the constraint
                other_variable = constraint.get_other(variable_to_assign) # get the other variable in the constraint besides the variable to assign 
                if domains.get(other_variable) != None: # check if the other variable has a domain
                    for other_value in domains[other_variable]: # check each value in the domain of the other variable
                        dicty = {variable_to_assign: value, other_variable: other_value} # create a dictionary with the variable to assign and its value and the other variable and its value
                        if not constraint.is_satisfied(dicty): # check if the dictionary is not consistent with the constraints
                            removed_values += 1 # if not, increment the number of removed values, don't remove them from the domain of the other variable
        remaining_candidates.append((value, removed_values))  # add the value and the number of removed values to the list of restraining values 
    remaining_candidates.sort(key=lambda candidate: (candidate[1], candidate[0])) # sort the list of restraining values based on the number of removed values for each value and then the value itself
    # sort according to the number of removed values first and then the value itself to make sure that the values with the same number of removed values are sorted in ascending order
    return [candidate[0] for candidate in remaining_candidates] # return the list of sorted values in the list of restraining values



# This function should return the variable that should be picked based on the MRV heuristic.
# IMPORTANT: This function should not modify any of the given arguments.
# IMPORTANT: Don't use the domains inside the problem, use and modify the ones given by the "domains" argument 
#            since they contain the current domains of unassigned variables only.
# IMPORTANT: If multiple variables have the same priority given the MRV heuristic, 
#            order them in the same order in which they appear in "problem.variables".
def minimum_remaining_values(problem: Problem, domains: Dict[str, set]) -> str:
    res = None # create a variable to store the variable with the minimum remaining values
    for variable in problem.variables: # check each variable in the problem 
        if variable in domains.keys(): # check if the variable has a domain, (this condition is necessary for the backtrack)
            if len(domains[variable]) == 0: # if the domain is empty, continue to the next variable  
                continue  
            if res == None: # if the variable with the minimum remaining values is not assigned yet, assign it to the current variable
                res = variable # initialize the variable with the minimum remaining values to be the current variable
            elif len(domains[variable]) < len(domains[res]): # if the domain of the current variable is smaller than the domain of the variable with the minimum remaining values, 
                # update the variable with the minimum remaining values to be the current variable
                res = variable
    return res # return the variable with the minimum remaining values


# This function should apply 1-Consistency to the problem.
# In other words, it should modify the domains to only include values that satisfy their variables' unary constraints.
# Then all unary constraints should be removed from the problem (they are no longer needed). -------------------
# The function should return False if any domain becomes empty. Otherwise, it should return True.
def one_consistency(problem: Problem) -> bool:
    for constraint in problem.constraints:
        if(type(constraint) == UnaryConstraint): # check if the constraint is unary 
            variable = constraint.variable # get the variable that the constraint applies to 
            values = problem.domains[variable].copy() # get the domain of the variable 
            accepted_values = [] # create a list to store the accepted values to replace them in the domain of the variable
            for value in values: # check each value in the domain of the variable
                dicty ={variable: value} # create a dictionary with the variable and its value
                if constraint.is_satisfied(dicty): # check if the dictionary is consistent with the constraints
                    accepted_values.append(value) # if yes, add the value to the list of accepted values
            problem.domains[variable] = set(accepted_values) # update the domain of the variable to be the list of accepted values
            if len(problem.domains[variable]) == 0: # if the domain is empty, return false
                return False
    problem.constraints = [constraint for constraint in problem.constraints if type(constraint) == BinaryConstraint] # remove the unary constraints from the problem
    return True
            

