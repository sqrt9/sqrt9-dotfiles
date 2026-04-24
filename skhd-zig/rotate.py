import copy
import argparse
import ast

#
#
# by theo
#
#


#
# generate a list of yabai commands to carousel monitors
# 1) keep top space on display consistent
# 2) keep one space on each display at all times
# 3) keep focus on called display
# 4) keep display space order consistent
#
# the following is done in order
# space tags are overriden to pass identifying messages regardless of state
# a flattened target order is generated
# swap OOO displays first to enforce 2)
# shift spaces on boundaries depending on their next pos for 4)
# run focus on face displays passed as arg for 1)
# run focus on original display passed as arg for 3)
# 

def tag(arr):
    """Give every space a label to focus
        independent of order"""
    for d in range(len(arr)):
        for s in range(len(arr[d])):
            print(f"yabai -m space {arr[d][s]} --label s{arr[d][s]}")
            arr[d][s] = "s" + str(arr[d][s])
    return arr


def move(a, i, arr, row_preference=None):
    """Move a space to index i. Takes a preference
        for space array (two i's exist if i is at
        the end or start of an array)"""
    print(f"yabai -m space {a} --move {i+1}")
    current_flat_idx = 0
    for j in range(len(arr)):
        row_len = len(arr[j])
        if current_flat_idx <= i <= current_flat_idx + row_len:
            if i == current_flat_idx + row_len and row_preference is not None:
                if row_preference > j:
                    current_flat_idx += row_len
                    continue
            local_idx = i - current_flat_idx
            arr[j].insert(local_idx, a)
            return arr
        current_flat_idx += row_len
    return arr


def swap(a, b, arr):
    """Swap two spaces"""
    for d in arr:
        for i in range(len(d)):
            if d[i] == a:
                d[i] = b
            elif d[i] == b:
                d[i] = a
    print(f"yabai -m space {a} --swap {b}")
    return arr


def cycle(a, d, arr):
    """Give the index of the next display"""
    for i in range(len(arr)):
        for s in arr[i]:
            if s == a:
                if d == "forward":
                    next = i + 1 if (i + 1 < len(arr)) else 0
                elif d == "back":
                    next = i - 1 if (i - 1 >= 0) else -1
                return next


def cycle_flat(arr, d):
    """Give a cycled version of the flatenned space array"""
    flat = [x for sub in arr for x in sub]
    lens = [len(sub) for sub in arr]
    if d == "forward":
        up_to_last = sum(lens[:-1])
        last = flat[-lens[-1] :]
        first = flat[:up_to_last]
        target = last + first
    elif d == "back":
        up_to_first = sum(lens[:1])
        last = flat[:up_to_first]
        first = flat[up_to_first:]
        target = first + last
    return target


def rotate(arr, d, fronts, front_display):
    """Move all spaces on each display in direction 'd', looping.
        Keep the visible spaces on top. Keep focus on current display."""
    arr = tag(arr)
    flat = [x for sub in arr for x in sub]
    target = cycle_flat(arr, d)
    c = copy.deepcopy(arr)
    if d == "forward":
        displays = [c[-1]] + c[:-1]
    if d == "back":
        displays = c[1:] + [c[0]]
    for i in range(len(flat)):
        if flat[i] != target[i]:
            arr = swap(flat[i], target[i], arr)
            j = flat.index(target[i])
            flat[i], flat[j] = flat[j], flat[i]
    lens = [len(sub) for sub in arr]
    state = copy.deepcopy(arr)
    for i in range(len(arr)):
        for j in range(len(arr[i])):
            if arr[i][j] not in displays[i]:
                if i - 1 >= 0:
                    for k in range(i - 1, -1, -1):
                        if arr[i][j] in displays[k]:
                            spot = sum(lens[:i])
                            state[i].pop(state[i].index(arr[i][j]))
                            print(f"yabai -m space {arr[i][j]} --display {k+1}")
                            state = move(arr[i][j], spot, state, k)
                if i + 1 < len(displays):
                    for k in range(i + 1, len(displays)):
                        if arr[i][j] in displays[k]:
                            spot = sum(lens[:k]) - 1
                            state[i].pop(state[i].index(arr[i][j]))
                            print(f"yabai -m space {arr[i][j]} --display {k+1}")
                            state = move(arr[i][j], spot, state, k)
    lens = [len(sub) for sub in displays]
    for i in range(len(displays)):
        for j in range(len(displays[i])):
            if state[i][j] != displays[i][j]:
                state = swap(state[i][j], displays[i][j], state)
            else:
                continue
    for s in fronts:
        print(f"yabai -m space --focus s{s}")
    print(f"yabai -m display --focus {front_display}")


if __name__ == "__main__":
    p = argparse.ArgumentParser()
    p.add_argument("--fronts", type=ast.literal_eval, required=True)
    p.add_argument("--front_display", type=int, required=True)
    p.add_argument("--direction", type=str, required=True)
    p.add_argument("--array", type=ast.literal_eval, required=True)

    args = p.parse_args()

    rotate(
        args.array,
        args.direction,
        args.fronts,
        args.front_display,
    )
