# -*- coding: utf-8 -*-
"""
Created on Sun Oct 13 10:24:12 2024
@author: POOJARN
"""
import re
import sys

class Interpreter:
    def __init__(self):
        self.symbol_table = {}
        self.lines = []
        self.current_line = 0

    def parse_value(self, value):
        if value == "TRUE":
            return ("Boolean", True)
        elif value == "FALSE":
            return ("Boolean", False)
        elif value.isdigit() or (value[0] == '-' and value[1:].isdigit()):
            return ("Integer", int(value))
        elif value.startswith('"') and value.endswith('"'):
            return ("String", value[1:-1])
        elif value in self.symbol_table:
            return self.symbol_table[value]
        else:
            raise RuntimeError(f"Runtime error: Variable '{value}' used before assignment")

    def execute(self, code):
        self.lines = code.split('\n')
        self.current_line = 0
        while self.current_line < len(self.lines):
            line = self.lines[self.current_line].strip()
            if not line:
                self.current_line += 1
                continue
            if line.startswith("PRINT"):
                self.handle_print(line)
            elif line.startswith("FOR"):
                self.handle_for(line)
            elif '=' in line or '+=' in line or '*=' in line or '&=' in line:
                self.handle_assignment(line)
            else:
                raise RuntimeError(f"Syntax error: Invalid statement '{line}'")
            self.current_line += 1

    def handle_print(self, line):
        parts = line.split()
        # if len(parts) != 3 or parts[1] != ';':
        #     raise RuntimeError(f"Syntax error: Invalid PRINT statement '{line}'")
        var_name = parts[1]
        if var_name not in self.symbol_table:
            raise RuntimeError(f"Runtime error: Variable '{var_name}' used before assignment")
        var_type, var_value = self.symbol_table[var_name]
        if var_type == "String":
            print(f'{var_name}="{var_value}"')
        else:
            print(f'{var_name}={var_value}')

    def handle_assignment(self, line):
        parts = line.split()
        if len(parts) < 3:
            raise RuntimeError(f"Syntax error: Invalid assignment statement '{line}'")
        var_name = parts[0]
        operator = parts[1]
        value = ' '.join(parts[2:])
        if value.endswith(';'):
            value = value[:-1].strip()
        if operator == '=':
            self.symbol_table[var_name] = self.parse_value(value)
        elif operator in ['+=', '*=', '&=']:
            if var_name not in self.symbol_table:
                raise RuntimeError(f"Runtime error: Variable '{var_name}' used before assignment")
            var_type, var_value = self.symbol_table[var_name]
            rhs_type, rhs_value = self.parse_value(value)
            if operator == '+=':
                if var_type == "String" and rhs_type == "String":
                    self.symbol_table[var_name] = ("String", var_value + rhs_value)
                elif var_type == "Integer" and rhs_type == "Integer":
                    self.symbol_table[var_name] = ("Integer", var_value + rhs_value)
                else:
                    raise RuntimeError(f"Runtime error: Invalid += operation between {var_type} and {rhs_type}")
            elif operator == '*=':
                if var_type == "Integer" and rhs_type == "Integer":
                    self.symbol_table[var_name] = ("Integer", var_value * rhs_value)
                else:
                    raise RuntimeError(f"Runtime error: Invalid *= operation between {var_type} and {rhs_type}")
            elif operator == '&=':
                if var_type == "Boolean" and rhs_type == "Boolean":
                    self.symbol_table[var_name] = ("Boolean", var_value and rhs_value)
                else:
                    raise RuntimeError(f"Runtime error: Invalid &= operation between {var_type} and {rhs_type}")

    def extract_lines(self, code_string):
        pattern = '; } }'
        index = code_string.find(pattern)
        if index >= 0:
            last = code_string[index + 6:-3]
            # Use regex to find the lines within the curly braces
            match = re.search(r'\{(.*?)\}', code_string, re.DOTALL)
            if match:
                # Extract the inner content and split by semicolon, stripping whitespace
                lines = match.group(1).split(';')
                if index >= 0:
                    lines.append(last)
                return [line.strip() for line in lines if line.strip()]
        return []

    def handle_for(self, line):
        parts = line.split()
        count = int(parts[1])
        block_lines = self.extract_lines(line)
        for _ in range(count):
            for block_line in block_lines:
                if block_line.startswith("FOR"):
                    self.handle_for(block_line + "; }")
                else:
                    self.handle_assignment(block_line)

def main():
    if len(sys.argv) != 2:
        print("Usage: python interpreter.py <input_file>")
        sys.exit(1)
    input_file = sys.argv[1]
    # Read code from the specified input file
    try:
        with open(input_file, 'r') as file:
            code = file.read()
    except FileNotFoundError:
        print(f"Error: File '{input_file}' not found.")
        sys.exit(1)
    # Create an instance of the interpreter
    interpreter = Interpreter()
    # Execute the code
    try:
        interpreter.execute(code)
    except RuntimeError as e:
        print(e)

if __name__ == "__main__":
    main()
