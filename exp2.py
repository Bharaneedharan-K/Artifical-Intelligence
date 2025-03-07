# Develop a water distribution system for gated community 
# villas using a water jug problem in python.



def distribute_water_to_villas(total_villas, villa_requirement):
    main_tank_capacity = 1000  # Main water tank capacity in liters
    remaining_water = main_tank_capacity
    
    print(f"Main Tank: {main_tank_capacity}L")
    
    for villa in range(1, total_villas + 1):
        if remaining_water >= villa_requirement:
            remaining_water -= villa_requirement
            print(f"Villa {villa} receives {villa_requirement}L of water")
            print(f"Remaining Tank Water: {remaining_water}L")
        else:
            print(f"Not enough water for Villa {villa}. Remaining: {remaining_water}L")
            break
    
    print("Water distribution completed!")

# Example: Distribute 4L of water to 10 villas
distribute_water_to_villas(5, 150)

