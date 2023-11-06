from typing import Any, Set, Tuple
from grid import Grid
import utils


def locate(grid: Grid, item: Any) -> Set[Tuple[int, int]]:
    '''
    This function takes a 2D grid and an item
    It should return a list of (x, y) coordinates that specify the locations that contain the given item
    To know how to use the Grid class, see the file "grid.py"  
    '''

    #! Algorithm: just iterate over the whole grid, and for each entry call getcell.
    #! Then we need to check if the item is same as what we found, then we just need
    #! to get add this indicies to our set result, otherwise we just keep iterating.
    rows: int = grid.height
    columns: int = grid.width

    #! Using normal forloops
    # setRes: Set[Tuple[int, int]] = set()
    # for i in range(rows+1):
    #     for j in range(columns+1):
    #         if(grid.__getitem__((i, j)) == item):
    #             print(grid.__getitem__((i, j)), item)
    #             setRes.add((i, j))
    #             print(setRes)

    # ? Compact way of solving the problem :D
    setRes: Set[Tuple[int, int]] = {(i, j) for i in range(
        rows + 1) for j in range(columns + 1) if(grid.__getitem__((i, j)) == item)}
    return setRes
