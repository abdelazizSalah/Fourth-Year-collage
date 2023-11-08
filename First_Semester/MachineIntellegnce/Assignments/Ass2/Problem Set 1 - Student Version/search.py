from problem import HeuristicFunction, Problem, S, A, Solution
from collections import deque
from helpers.utils import NotImplemented
from typing import Dict
#TODO: Import any modules you want to use
import heapq
#? for UCS
from heapdict import heapdict # this is a priority queue in which we can update the elements.


# All search functions take a problem and a state
# If it is an informed search function, it will also receive a heuristic function
# S and A are used for generic typing where S represents the state type and A represents the action type

# All the search functions should return one of two possible type:
# 1. A list of actions which represent the path from the initial state to the final state
# 2. None if there is no solution
def findPath(pathTracker, initial_state, nextState, action):
    '''
        utility function used to get the path of the solution from the goal node till the initial state node.
    '''
    path = []
    path.append(action)
    while initial_state != nextState:
        path.append(pathTracker[nextState][1])
        nextState = pathTracker[nextState][0]
    return path[::-1]

def BreadthFirstSearch(problem: Problem[S, A], initial_state: S) -> Solution:
    '''
        S -> state type
        A -> Action type
        LOGIC:
            we just need to iterate over the neighbours first, then start executing them First in First out. 
            steps:
                1. initialize a node with the given initial state
                2. if this state was a goal
                    1. return the actions for this state.
                3. create an empty queue
                4. create a bool vector to mark the visited nodes inside it. 
                5. loop
                    1. if the queue is empty
                        1. return a NULL
                    2. get the first element in the queue.
                    3. mark this node as visited
                    4. for each action of this node.
                        1. extract one of its children.
                        2. if this child was neither explored nor in the frontier
                            1. if it was a goal
                                1. then we just need to return its soltion
                            2. else 
                                1. insert it in the queue.
                #! Note> to know wethere it is in the queue or not, we can make another grey vector, in which we mark the nodes which are
                #! inside the queue.

                #? Another Note: we need to keep tracking of the path we used to reach that goal!
                #TODO: check the algorithms steps in the attached photos in the *BFS Analysis* folder.
    '''
    state = initial_state
    if problem.is_goal(state):
        return [] # no actions are applied, we are already in the goal state.
    frontier:deque = deque()
    frontier.append(state)
    explored:map(S, bool) = {} # represents the previously visited states.
    inQueue:map(S, bool) = {
        state: True
    } # represents the states that are going to be visited in the queue.
    pathTracker:map(S, (S, A)) = {} # this for each state, we store who is its parent, and what action is done to achieve this state.
    while len(frontier):
        state = frontier.popleft() # this is how deque work as a queue not vector, we extract elements from the beginning not from the end.
        explored[state] = True # mark as visited
        inQueue[state] = False # mark is out from the queue
        actions = problem.get_actions(state)
        for action in actions:
            nextState = problem.get_successor(state, action)
            if nextState not in explored and nextState not in inQueue:
                if problem.is_goal(nextState):
                    return findPath(pathTracker, initial_state, state, action)
                frontier.append(nextState)
                inQueue[nextState] = True
                pathTracker[nextState] = (state, action)
    return None # no possible path is found



def DepthFirstSearch(problem: Problem[S, A], initial_state: S) -> Solution:
    '''
        we need to apply the dfs searching algorithm to make the model reach the goal state.
        all we need to do is to use the LIFO logic.
        
        #TODO: check the algorithms steps in the attached photos in the *DFS Analysis* folder.
    '''
    
    def  DFS(problem:Problem[S,A], state:S,explored, wayToGoal:deque):
        '''
            utility function used to apply the dfs algorithm
        '''
        # base cases
        if state in explored :
            return False
        if problem.is_goal(state):
            return True
        explored[state] = True
        actions = problem.get_actions(state)
        for action in actions:
            nextState = problem.get_successor(state, action)
            goalFound = DFS(problem, nextState, explored, wayToGoal)
            if(goalFound):
                wayToGoal.appendleft(action) # to avoid reversing.
                return True
            
        return False # no goal is found.

    if problem.is_goal(initial_state):
        return []
    explored:map(S, bool) = {} # represents the previously visited states.
    wayToGoal:deque = deque()
    goalFound:bool = DFS(problem, initial_state,explored, wayToGoal)
    if goalFound:
        return wayToGoal
    return None # no solution is found. 
    

  
'''
    Notes:
        e3ml class esmo node w 7ot feh el time stamp wl weight w keda 34an mttl5btsh.
'''
def UniformCostSearch(problem: Problem[S, A], initial_state: S) -> Solution:
    '''
        all we need to do is to use the same logic of BFS but with small modifications
        1. instead on normal queue, we need to use a priority queue
        2. priority based on 2 main factors
            1. path cost.
            2. timeStamp -> time of insertion, to allow in case of tie, to extract the first inserted state.
        3. when we found a state which was previously inserted before, but with better path cost, we need to update its cost -> that is why I used 
        heapdict to allow me to update the values of the elements inside the priority queue.
        #TODO: check the algorithms steps in the attached photos in the *UCS Analysis* folder.
    '''
    path_cost = 0
    timeStamp= 0 # this to make the first inserted first extracted.
    state = problem.get_initial_state()
    if problem.is_goal(state):
        return [] # no actions are applied, we are already in the goal state.
    frontier = heapdict() # cost , timeStamp
    frontier[initial_state] = (path_cost, timeStamp)
    timeStamp += 1 #increment the time stamp after each insertion.
    explored:map(S, bool) = {} # represents the previously visited states.
    pathTracker:map(S, (S, A)) = {} # this for each state, we store who its parent is, and what action is done to achieve this state.
    while len(frontier):
        minimumState = frontier.popitem() # retrieve the state with minimum path cost, then minimum timestamp. 
        state, parentStateCost = minimumState[0], minimumState[1][0] 
        if problem.is_goal(state):
            return findPath(pathTracker, initial_state, state, action)[:-1]
        explored[state] = True # mark as visited
        actions = problem.get_actions(state)
        for action in actions:
            nextState = problem.get_successor(state, action)
            if nextState not in explored and nextState not in frontier:
                childStateCost = parentStateCost+ problem.get_cost(state, action) # the cost to reach the current state + the cost to reach the new state.
                frontier[nextState] = (childStateCost, timeStamp)
                timeStamp += 1
                pathTracker[nextState] = (state, action)
            elif nextState in frontier: 
                childStateCost =  parentStateCost + problem.get_cost(state, action)
                previousCost = frontier[nextState][0] 
                if(previousCost > childStateCost): # if we found the same state but with lower path cost
                    frontier[nextState] = (childStateCost,timeStamp) # assume that we will
                    timeStamp += 1
                    pathTracker[nextState] = (state, action) # update the pathTracker
                    
    return None # no possible path is found


def AStarSearch(problem: Problem[S, A], initial_state: S, heuristic: HeuristicFunction) -> Solution:
    #TODO: ADD YOUR CODE HERE
    NotImplemented()

def BestFirstSearch(problem: Problem[S, A], initial_state: S, heuristic: HeuristicFunction) -> Solution:
    #TODO: ADD YOUR CODE HERE
    NotImplemented()





    