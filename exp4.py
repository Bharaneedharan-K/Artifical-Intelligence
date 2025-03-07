import itertools

def calculate_distance(path, distance_matrix):
    total_distance = 0
    for i in range(len(path) - 1):
        total_distance += distance_matrix[path[i]][path[i + 1]]
    total_distance += distance_matrix[path[-1]][path[0]]  # Returning to start
    return total_distance

def find_best_tourism_route(cities, distance_matrix):
    min_distance = float('inf')
    best_route = None
    
    for perm in itertools.permutations(range(len(cities))):
        current_distance = calculate_distance(perm, distance_matrix)
        if current_distance < min_distance:
            min_distance = current_distance
            best_route = perm
    
    return [cities[i] for i in best_route], min_distance

# Updated city names (Added CityE)
cities = ["CityA", "CityB", "CityC", "CityD", "CityE"]

# Updated distance matrix including CityE
distance_matrix = [
    [0, 10, 15, 20, 25],  # CityA
    [10, 0, 35, 25, 30],  # CityB
    [15, 35, 0, 30, 40],  # CityC
    [20, 25, 30, 0, 45],  # CityD
    [25, 30, 40, 45, 0]   # CityE (newly added)
]

best_route, min_distance = find_best_tourism_route(cities, distance_matrix)

print("Optimal Tourism Route:", " -> ".join(best_route))
print("Minimum Travel Distance:", min_distance)
