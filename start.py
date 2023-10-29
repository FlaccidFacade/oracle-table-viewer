import time

actions = []

while True:
    action = input("Enter an action to time (or 'done' to finish): ")
    if action == "done":
        break
    actions.append(action)

print("Timing actions...")
for action in actions:
    print(f"Starting timer for '{action}'")
    start_time = time.time()
    input("Press Enter to stop the timer...")
    end_time = time.time()
    elapsed_time = end_time - start_time
    print(f"Time elapsed for '{action}': {elapsed_time:.2f} seconds")