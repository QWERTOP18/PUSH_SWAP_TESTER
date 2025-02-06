#!/opt/homebrew/bin/python3
import subprocess
import random
import statistics

def run_push_swap(n, iterations):
    results = []

    for _ in range(iterations):
        sequence = ' '.join(map(str, random.sample(range(1, n + 1), n)))
        result = subprocess.run(f"../push_swap {sequence} | wc -l", shell=True, capture_output=True, text=True)
        results.append(int(result.stdout.strip()))

    max_value = max(results)
    min_value = min(results)
    avg_value = int(statistics.mean(results))

    print(f"MAX: {max_value}")
    print(f"MIN: {min_value}")
    print(f"AVE: {avg_value}")

def main():
    test_cases = [(5, 100), (100, 100), (500, 30)]
    for n, iterations in test_cases:
        print(f"TEST {n}\n--------")
        run_push_swap(n, iterations)
        print("")

if __name__ == "__main__":
    main()
