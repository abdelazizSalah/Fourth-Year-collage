from sokoban import SokobanProblem, SokobanState
from mathutils import Direction, Point, manhattan_distance
from helpers.utils import NotImplemented

# This heuristic returns the distance between the player and the nearest crate as an estimate for the path cost
# While it is consistent, it does a bad job at estimating the actual cost thus the search will explore a lot of nodes before finding a goal
def weak_heuristic(problem: SokobanProblem, state: SokobanState):
    return min(manhattan_distance(state.player, crate) for crate in state.crates) - 1

#TODO: Import any modules and write any functions you want to use


def strong_heuristic(problem: SokobanProblem, state: SokobanState) -> float:
    #TODO: ADD YOUR CODE HERE
    #IMPORTANT: DO NOT USE "problem.get_actions" HERE.
    # Calling it here will mess up the tracking of the expanded nodes count
    # which is the number of get_actions calls during the search
    #NOTE: you can use problem.cache() to get a dictionary in which you can store information that will persist between calls of this function
    # This could be useful if you want to store the results heavy computations that can be cached and used across multiple calls of this function
    # You can use the state.layout attribute to access the layout of the problem
    '''
        The main logic is that we will use manhatten distance to get the distance between each crate and the nearest goal
        and the heuristic will be the sum of all these distances.

        but there will be some corner cases, which when the carets are in a position that they can't be moved to any goal
        we call these positions as a deadlock, so at this state, we should set the heuristic of this state as inf. 

        types of deadlocks are 4:
        1. square deadlock :
                  $#
                  $# and any shape like this. 
        2. L deadlock:
                    ##
                    #$ and any shape like this.
        3. corner deadlock:
                    ##
                    $#
                     #
                     #
                     #
                     #
        4. at a side deadlock:
        ##############
                     # here we can not move this caret to left.
                 g  $#
                     #
                     #
        ##############
        any case rather than those, will be solvable, so I just need some time to implement this.
        but since tommorow is networks exam, and now it is 4 pm, I won't be able to implement this.
        If I have just have more time I will get this correct isa, and by the way I will implement it even If I did not get the marks of this.
    '''
    
