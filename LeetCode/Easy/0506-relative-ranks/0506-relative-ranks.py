class Solution:
    def findRelativeRanks(self, score: List[int]) -> List[str]:
    # 1. Sort
    # 2. Save {<score>:<rank>} in a dictionary
    # 3. Make a new list while iterating `score` and using the dictionary

        # 1
        score_sorted = sorted(score, reverse=True)

        # 2
        dict = {}
        for i in range(len(score_sorted)):
            result = ""
            if i == 0:
                result = "Gold Medal"
            elif i == 1:
                result = "Silver Medal"
            elif i == 2:
                result = "Bronze Medal"
            else:
                result = f"{i + 1}"

            dict[score_sorted[i]] = result

        result = []

        # 3
        for s in score:
            result.append(dict[s])

        return result