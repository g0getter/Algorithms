def solution(string):
    stack = []

    for char in string:
        if char == "(":
            stack.append(char)
        else:
            if len(stack) == 0:
                return False
            else:
                stack.pop()

    return len(stack) == 0