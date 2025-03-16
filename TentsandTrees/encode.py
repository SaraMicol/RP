import sys

def encode(input_file, output_file):
    with open(input_file, 'r') as f:
        lines = f.readlines()

    # Extract grid size (number of rows/columns)
    n = len(lines) - 2  # last two lines are constraints
     
    size_fact = f"dim({n})."

    # Extract the grid and build facts for 'tree' and 'empty'
    grid_facts = []
    for row in range(n):
        line = lines[row].strip()  # Remove newline character
        for col in range(n):
            if line[col] == 't':
                grid_facts.append(f"tree({row}, {col}).")  # Start from 0
            elif line[col] == '.':
                grid_facts.append(f"empty({row}, {col}).")  # Start from 0

    # Extract column constraints (second last line)
    column_constraints = list(map(int, lines[-2].strip().split()))
    column_facts = [f"column_constraint({col}, {num})." for col, num in enumerate(column_constraints)]  # Start from 0

    # Extract row constraints (last line)
    row_constraints = list(map(int, lines[-1].strip().split()))
    row_facts = [f"row_constraint({row}, {num})." for row, num in enumerate(row_constraints)]  # Start from 0

    # Combine all facts
    all_facts = [size_fact]+ grid_facts + column_facts + row_facts 

    # Write facts to output file
    with open(output_file, 'w') as f:
        for fact in all_facts:
            f.write(fact + '\n')

if __name__ == '__main__':
    if len(sys.argv) != 3:
        print("Usage: python3 encode.py <input_file> <output_file>")
    else:
        input_file = sys.argv[1]
        output_file = sys.argv[2]
        encode(input_file, output_file)
