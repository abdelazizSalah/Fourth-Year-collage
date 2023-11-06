from typing import Any, Dict, Set, Tuple, List
from problem import Problem
from mathutils import Direction, Point
from helpers.utils import NotImplemented
DEBUG = False
#! The parking state is the dictionary which tells us where each car stands after each action. 
#? initially it should contains the initial position of each car.
#? then after each action we should modify it.
#? it is a dictionary of int and point
    #? int: the index of the car
    #? point: the position of the car  
ParkingState= Dict[int, Point] 

# An action of the parking problem is a tuple containing an index 'i' and a direction 'd' where car 'i' should move in the direction 'd'.
ParkingAction = Tuple[int, Direction]

# This is the implementation of the parking problem
class ParkingProblem(Problem[ParkingState, ParkingAction]):
    passages: Set[Point]    # A set of points which indicate where a car can be (in other words, every position except walls).
    
    #! de amakn el 3arbyat.
    cars: Tuple[Point]      # A tuple of points where state[i] is the position of car 'i'. 
    
    #! el amakn elly 3auzen nro7laha.
    slots: Dict[Point, int] # A dictionary which indicate the index of the parking slot (if it is 'i' then it is the lot of car 'i') for every position.
                            # if a position does not contain a parking slot, it will not be in this dictionary.
  
    width: int              # The width of the parking lot.
    height: int             # The height of the parking lot.

    def isValidLocation(self, p:Point, state:ParkingState, car_number:int) -> bool:
        '''
            This is a utility function responsible for checking wethere the given point is an empty cell "valid position" or not
            Logic: 
                1. the given p must be in the passages
                2. no other cars should exist in that passage.
            Input:
                p: the debatable point
                state: the current state
                car_number: the index of the car that we should apply on it the transition action. 
            Output: bool
                True: if valid.
                False: otherwise.
        '''
        if p in self.passages:
            for car_idx, car_loc in state.items():
                if car_idx != car_number and car_loc == p:
                    return False
        else:
            return False
        return True 

    # This function should return the initial state
    def get_initial_state(self) -> ParkingState:
        '''
            Our initial state is the locations of the cars, so we need to return a dictionary of the cars and their locations.
            So all what we are going to do is to initialize the "ParkingState" map with the initial locations of the cars.
        '''
        ParkingState:Dict[int, Point] = {}
        for i in range(len(self.cars)):
            ParkingState[i] = self.cars[i]
        return ParkingState
    
    # This function should return True if the given state is a goal. Otherwise, it should return False.
    def is_goal(self, state:ParkingState) -> bool:
        '''
            Our main goal is to locate each car in its slot.
            to do so, we need to iterate over the current state,
            and check that each car is in the slot of its index.
        ''' 
        for car_idx, car_loc in state.items():
            if ((car_loc not in self.slots) or (self.slots[car_loc] != car_idx)) :
                #! this mean that there is a car standing in a wrong slot.
                #? or there is a car standing in a position rather than the available slots.
                return False
        return True
        
    
    # This function returns a list of all the possible actions that can be applied to the given state
    def get_actions(self, state: ParkingState) -> List[ParkingAction]:
        '''
            here we should iterate over all cars, check if the next position(NSEW) is free or not.
            then we should move it. 
        '''
        #! in this we should store all possible actions. 
        ParkingAction = []
        dir = {
        # Point( 1,  0), # R
        # Point( 0, -1), # U
        # Point(-1,  0), # L
        # Point( 0,  1)  # D
            0:Point( 1,  0),
            1:Point( 0, -1),
            2:Point(-1,  0),
            3:Point( 0,  1),
        }
        for car_idx, car_loc in state.items():
            for i in range(4):
                p = Point(car_loc.x+dir[i].x, car_loc.y+dir[i].y)
                # p = Point(car_loc.x+dx[i], car_loc.y+dy[i])
                if(self.isValidLocation(p, state, car_idx)):
                    ParkingAction.append((car_idx, Direction(i)))
        return ParkingAction
    
    # This function returns a new state which is the result of applying the given action to the given state
    def get_successor(self, state: ParkingState, action: ParkingAction) -> ParkingState:
        '''
            LOGIC: 
                We should update one car only here with the sent parking action. 
            INPUT: 
                state: The current state
                action: the action to be executed
            OUTPUT: 
                new ParkingState
        '''
        #! this to make a deep copy and do not affect the current state. 
        newState = {k:v for k,v in state.items()}
        dir = {
            Direction.RIGHT: Point( 1,  0),
            Direction.UP:    Point( 0, -1),
            Direction.LEFT:  Point(-1,  0),
            Direction.DOWN:  Point( 0,  1),
        }
        prevPoint = state[action[0]]
        newPoint = Point(prevPoint.x + dir[action[1]].x, prevPoint.y+ dir[action[1]].y)
        newState[action[0]] = newPoint
        return newState
    
    # This function returns the cost of applying the given action to the given state
    def get_cost(self, state: ParkingState, action: ParkingAction) -> float:
        '''
            LOGIC: 
                we should define a map for the costs
                if 0 -> 26
                else if 1 -> 25 and so on.
                the generic equation is moveCost = 26 - (c - 'A') where c is the car letter.
                also we should check, if the new location is one of other cars locations, we should cost it 100
        '''
        carIdx, newDir = action[0],action[1]
        cost = 26 - carIdx
        dir = {
            Direction.RIGHT: Point( 1,  0),
            Direction.UP:    Point( 0, -1),
            Direction.LEFT:  Point(-1,  0),
            Direction.DOWN:  Point( 0,  1),
        }
        prevPoint = state[carIdx]
        newPoint = Point(prevPoint.x + dir[newDir].x, prevPoint.y+ dir[newDir].y)


        #! standing on other employee slot
        for carLoc, idx in self.slots.items():
            if idx != carIdx and newPoint == carLoc:
                cost += 100
                if DEBUG:
                    print(cost)
                return cost
        if DEBUG:
            print(cost)
        return cost
    
     # Read a parking problem from text containing a grid of tiles
    @staticmethod
    def from_text(text: str) -> 'ParkingProblem':
        passages =  set()
        cars, slots = {}, {}
        lines = [line for line in (line.strip() for line in text.splitlines()) if line]
        width, height = max(len(line) for line in lines), len(lines)
        for y, line in enumerate(lines):
            for x, char in enumerate(line):
                if char != "#":
                    passages.add(Point(x, y))
                    if char == '.':
                        pass
                    elif char in "ABCDEFGHIJ":
                        cars[ord(char) - ord('A')] = Point(x, y)
                    elif char in "0123456789":
                        slots[int(char)] = Point(x, y)
        problem = ParkingProblem()
        problem.passages = passages
        problem.cars = tuple(cars[i] for i in range(len(cars)))
        problem.slots = {position:index for index, position in slots.items()}
        problem.width = width
        problem.height = height
        if DEBUG:
            ParkingState = problem.get_initial_state()
            isGoal = problem.is_goal(ParkingState)
            actions = problem.get_actions(ParkingState)
            for action in actions:
                problem.get_successor(ParkingState, action)
                problem.get_cost(ParkingState, action)
        
        return problem

    # Read a parking problem from file containing a grid of tiles
    @staticmethod
    def from_file(path: str) -> 'ParkingProblem':
        with open(path, 'r') as f:
            return ParkingProblem.from_text(f.read())
    