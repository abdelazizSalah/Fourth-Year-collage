from typing import Any, Dict, Set, Tuple, List
from problem import Problem
from mathutils import Direction, Point
from helpers.utils import NotImplemented

#! The parking state is the dictionary which tells us where each car stands after each action. 
#? initially it should contains the initial position of each car.
#? then after each action we should modify it.
#? it is a dictionary of int and point
    #? int: the index of the car
    #? point: the position of the car  
ParkingState= Dict[ int, Point] 

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
    def isValidLocation(self, p:Point):
        # if p in self.passages
        return True

    # This function should return the initial state
    '''
        Our initial state is the locations of the cars, so we need to return a dictionary of the cars and their locations.
        So all what we are going to do is to initialize the "ParkingState" map with the initial locations of the cars.
    '''
    def get_initial_state(self) -> ParkingState:
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
        parkingActions = []
        #?    L,R,U,D
        dx = [0,0,-1,1]
        dy = [-1,1,0,0]
        for car_idx, car_loc in state.items():
            for i in range(4):
                parkingActions.append(Point(car_loc.x+dx[i], car_loc.y+dy[i]))
        return parkingActions
    
    # This function returns a new state which is the result of applying the given action to the given state
    def get_successor(self, state: ParkingState, action: ParkingAction) -> ParkingState:
        #TODO: ADD YOUR CODE HERE
        NotImplemented()
    
    # This function returns the cost of applying the given action to the given state
    def get_cost(self, state: ParkingState, action: ParkingAction) -> float:
        #TODO: ADD YOUR CODE HERE
        NotImplemented()
    
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
        ParkingState = problem.get_initial_state()
        print(problem.is_goal(ParkingState))
        
        return problem

    # Read a parking problem from file containing a grid of tiles
    @staticmethod
    def from_file(path: str) -> 'ParkingProblem':
        with open(path, 'r') as f:
            return ParkingProblem.from_text(f.read())
    
# testing the logic
ParkingProblem.from_file("First_Semester\MachineIntellegnce\Assignments\Ass2\Problem Set 1 - Student Version\parks\park1.txt")

