# Find all pairs in an array that sum up to a target value

def find_pairs(nums, target):
    pairs = []
    seen = set()
    for num in nums:
        diff = target - num
        if diff in seen:
            pairs.append((diff, num))
        seen.add(num)
    return pairs

print(find_pairs([1, 2, 3, 4, 5], 5))
print(find_pairs([2, 4, 3, 3], 6))