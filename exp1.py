from collections import deque

def transport_goods():
    start = {"Fruits": 3, "Electronics": 3}
    end = {"Fruits": 0, "Electronics": 0}
    boat_capacity = 2
    queue = deque()
    queue.append((start.copy(), end.copy(), 1, []))  # 1 means boat on start side
    visited = set()
    
    possible_moves = [(1,0), (2,0), (0,1), (0,2), (1,1)]  # (Fruits, Electronics)
    
    while queue:
        start, end, boat_side, moves = queue.popleft()
        
        if end["Fruits"] == 3 and end["Electronics"] == 3:
            print("All goods successfully transported!")
            print("Transport Sequence:")
            for i, move in enumerate(moves, 1):
                print(f"Step {i}: Transported {move[0]} Fruits, {move[1]} Electronics")
            return
        
        if str((start, end, boat_side)) in visited:
            continue
        visited.add(str((start, end, boat_side)))
        
        for p, np in possible_moves:
            if boat_side == 1:  # Boat at start side
                new_start = {"Fruits": start["Fruits"] - p, "Electronics": start["Electronics"] - np}
                new_end = {"Fruits": end["Fruits"] + p, "Electronics": end["Electronics"] + np}
            else:  # Boat at end side
                new_start = {"Fruits": start["Fruits"] + p, "Electronics": start["Electronics"] + np}
                new_end = {"Fruits": end["Fruits"] - p, "Electronics": end["Electronics"] - np}
            
            if all(v >= 0 for v in new_start.values()) and all(v >= 0 for v in new_end.values()):
                queue.append((new_start, new_end, 1 - boat_side, moves + [(p, np)]))
    
    print("No valid solution found.")

transport_goods()
