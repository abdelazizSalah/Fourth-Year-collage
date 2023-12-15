from typing import Tuple
import re
from CSP import Assignment, Problem, UnaryConstraint, BinaryConstraint

#TODO (Optional): Import any builtin library or define any helper function you want to use
import itertools


# This is a class to define for cryptarithmetic puzzles as CSPs
class CryptArithmeticProblem(Problem):
    LHS: Tuple[str, str]
    RHS: str

    # Convert an assignment into a string (so that is can be printed).
    def format_assignment(self, assignment: Assignment) -> str:
        LHS0, LHS1 = self.LHS
        RHS = self.RHS
        letters = set(LHS0 + LHS1 + RHS)
        formula = f"{LHS0} + {LHS1} = {RHS}"
        postfix = []
        valid_values = list(range(10))
        for letter in letters:
            value = assignment.get(letter)
            if value is None: continue
            if value not in valid_values:
                postfix.append(f"{letter}={value}")
            else:
                formula = formula.replace(letter, str(value))
        if postfix:
            formula = formula + " (" + ", ".join(postfix) +  ")" 
        return formula

    @staticmethod
    def from_text(text: str) -> 'CryptArithmeticProblem':
        # Given a text in the format "LHS0 + LHS1 = RHS", the following regex
        # matches and extracts LHS0, LHS1 & RHS
        # For example, it would parse "SEND + MORE = MONEY" and extract the
        # terms such that LHS0 = "SEND", LHS1 = "MORE" and RHS = "MONEY"
        pattern = r"\s*([a-zA-Z]+)\s*\+\s*([a-zA-Z]+)\s*=\s*([a-zA-Z]+)\s*"
        match = re.match(pattern, text)
        if not match: raise Exception("Failed to parse:" + text)
        LHS0, LHS1, RHS = [match.group(i+1).upper() for i in range(3)]

        problem = CryptArithmeticProblem()
        problem.LHS = (LHS0, LHS1)
        problem.RHS = RHS

        #TODO Edit and complete the rest of this function
        # problem.variables:    should contain a list of variables where each variable is string (the variable name)
        # problem.domains:      should be dictionary that maps each variable (str) to its domain (set of values)
        #                       For the letters, the domain can only contain integers in the range [0,9].
        # problem.constaints:   should contain a list of constraint (either unary or binary constraints).
        # define carries 
        
        problem.variables = list(set(LHS0 + LHS1 + RHS))
        problem.domains = {letter: set(range(10)) for letter in problem.variables}
        problem.constraints = []
        # Unary constraints for the first letter of each word
        problem.constraints.append(UnaryConstraint(LHS0[0], lambda x: x != 0))
        problem.constraints.append(UnaryConstraint(LHS1[0], lambda x: x != 0))
        problem.constraints.append(UnaryConstraint(RHS[0], lambda x: x != 0))
        # Binary constraints for all letters
        for letter in problem.variables:
            problem.constraints.append(BinaryConstraint(letter, LHS0, lambda x, y: x != y))
            problem.constraints.append(BinaryConstraint(letter, LHS1, lambda x, y: x != y))
            problem.constraints.append(BinaryConstraint(letter, RHS, lambda x, y: x != y))
        # Binary constraints for the sum
        for i in range(len(RHS)):
            problem.constraints.append(BinaryConstraint(RHS[-i-1], LHS0[-i-1], lambda x, y: x == y))
            problem.constraints.append(BinaryConstraint(RHS[-i-1], LHS1[-i-1], lambda x, y: x == y))
            problem.constraints.append(BinaryConstraint(RHS[-i-1], RHS[-i-1], lambda x, y: x == y))
        # Binary constraints for the carry
        for i in range(len(RHS)-1):
            problem.constraints.append(BinaryConstraint(RHS[-i-2], LHS0[-i-1], lambda x, y: x == y))
            problem.constraints.append(BinaryConstraint(RHS[-i-2], LHS1[-i-1], lambda x, y: x == y))
            problem.constraints.append(BinaryConstraint(RHS[-i-2], RHS[-i-1], lambda x, y: x == y))
        
        # what else ?
        


        return problem

    # Read a cryptarithmetic puzzle from a file
    @staticmethod
    def from_file(path: str) -> "CryptArithmeticProblem":
        with open(path, 'r') as f:
            return CryptArithmeticProblem.from_text(f.read())