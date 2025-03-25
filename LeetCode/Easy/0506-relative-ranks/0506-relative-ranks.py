class Solution:
    def findRelativeRanks(self, score: List[int]) -> List[str]:
    # 1. Sort
    # 2. Save {<score>:<rank>} in a dictionary
    # 3. Make a new list while iterating `score` and using the dictionary

        # 1
        score_sorted = sorted(score, reverse=True)

        # 2
        medals = ["Gold Medal", "Silver Medal", "Bronze Medal"]
        rank_mapping = {score: medals[i] if i < 3 else str(i + 1) for i, score in enumerate(score_sorted)}

        # dict = {} 
        # for i in range(len(score_sorted)):
        #     result = ""
        #     if i < 3:
        #         result = medals[i]
        #     else:
        #         result = f"{i + 1}"

        #     dict[score_sorted[i]] = result

        # result = []

        # 3
        return [rank_mapping[score] for score in score]

        # for s in score:
        #     result.append(dict[s])

        # return result