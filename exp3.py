# Develop network routing analogous to the 8 queen’s 
# problem for traffic monitoring in smart cities using python.

#for all posible output

import numpy as np

def is_safe(board, row, col, size):
    for i in range(col):
        if board[row][i] == 'R':
            return False
    
    for i, j in zip(range(row, -1, -1), range(col, -1, -1)):
        if board[i][j] == 'R':
            return False
    
    for i, j in zip(range(row, size, 1), range(col, -1, -1)):
        if board[i][j] == 'R':
            return False
    
    return True

def solve_routing(board, col, size, solutions):
    if col >= size:
        solutions.append(np.array(board))
        return
    
    for i in range(size):
        if is_safe(board, i, col, size):
            board[i][col] = 'R'
            solve_routing(board, col + 1, size, solutions)
            board[i][col] = 0

def traffic_routing_smart_city(size):
    board = [[0] * size for _ in range(size)]
    solutions = []
    solve_routing(board, 0, size, solutions)
    return solutions

size = 4  # 4 intersections for a 4x4 grid representing traffic routing
routes = traffic_routing_smart_city(size)

print(f"Total possible traffic routing solutions: {len(routes)}")
for idx, solution in enumerate(routes, 1):  # Displaying all solutions
    print(f"Solution {idx}:")
    print(np.array(solution))
    print()




#for 1 output 

# import numpy as np

# def is_safe(board, row, col, size):
#     for i in range(col):
#         if board[row][i] == 1:
#             return False
    
#     for i, j in zip(range(row, -1, -1), range(col, -1, -1)):
#         if board[i][j] == 1:
#             return False
    
#     for i, j in zip(range(row, size, 1), range(col, -1, -1)):
#         if board[i][j] == 1:
#             return False
    
#     return True

# def solve_routing(board, col, size, solutions):
#     if col >= size:
#         solutions.append(np.array(board))
#         return
    
#     for i in range(size):
#         if is_safe(board, i, col, size):
#             board[i][col] = 1
#             solve_routing(board, col + 1, size, solutions)
#             board[i][col] = 0

# def traffic_routing_smart_city(size):
#     board = [[0] * size for _ in range(size)]
#     solutions = []
#     solve_routing(board, 0, size, solutions)
#     return solutions

# size = 4  # 4 intersections for a 4x4 grid representing traffic routing
# routes = traffic_routing_smart_city(size)

# print(f"Total possible traffic routing solutions: {len(routes)}")
# for idx, solution in enumerate(routes[:1], 1):  # Displaying only the first solution
#     print(f"Solution {idx}:")
#     print(np.array(solution))

