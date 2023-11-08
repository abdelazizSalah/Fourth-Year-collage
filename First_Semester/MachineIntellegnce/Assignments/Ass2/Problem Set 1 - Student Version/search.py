from problem import HeuristicFunction, Problem, S, A, Solution
from collections import deque
from helpers.utils import NotImplemented
from typing import Dict
#TODO: Import any modules you want to use
#? for UCS
import heapq

# All search functions take a problem and a state
# If it is an informed search function, it will also receive a heuristic function
# S and A are used for generic typing where S represents the state type and A represents the action type

# All the search functions should return one of two possible type:
# 1. A list of actions which represent the path from the initial state to the final state
# 2. None if there is no solution
def getSolution(initialState:S,currentState:S,currentAction:A ,pathTracker:dict,path:list):
    '''
        this is a utility function used to get the full path
    '''
    pathTracker[child] = (currentAction,currentState)
    while child != initialState:
        path.append(pathTracker[child][0])
        child = pathTracker[child][1]
    # reverse list
    path = path[::-1]
    return path
    # if initialState == currentState:
    #     return path
    # path.append(currentAction)
    # getSolution(initialState, pathTracker[currentState][1],pathTracker[currentState][0], pathTracker, path)

    

    



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
    '''
    initial_state = problem.get_initial_state()
    frontier = deque()
    frontierDict = {}
    explored = {}
    stateActions = {}
    frontier.append(initial_state)
    path = None
    while len(frontier) != 0:
        state = frontier.popleft()
        actions = problem.get_actions(state)
        explored[state] = True
        for action in actions:
            child = problem.get_successor(state,action)
            if problem.is_goal(child):
                path = []
                stateActions[child] = (action,state)
                while child != initial_state:
                    path.append(stateActions[child][0])
                    child = stateActions[child][1]
                # reverse list
                path = path[::-1]
                return path
            if explored.get(child,None) == None and frontierDict.get(child,None) == None :
                frontier.append(child)
                # add child to frontierDict
                frontierDict[child] = True
                stateActions[child] = (action,state)
                

    return path



def DepthFirstSearch(problem: Problem[S, A], initial_state: S) -> Solution:
    #TODO: ADD YOUR CODE HERE
    NotImplemented()
    

def UniformCostSearch(problem: Problem[S, A], initial_state: S) -> Solution:
    #TODO: ADD YOUR CODE HERE
    NotImplemented()

def AStarSearch(problem: Problem[S, A], initial_state: S, heuristic: HeuristicFunction) -> Solution:
    #TODO: ADD YOUR CODE HERE
    NotImplemented()

def BestFirstSearch(problem: Problem[S, A], initial_state: S, heuristic: HeuristicFunction) -> Solution:
    #TODO: ADD YOUR CODE HERE
    NotImplemented()

