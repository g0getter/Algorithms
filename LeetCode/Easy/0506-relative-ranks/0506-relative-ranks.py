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

        # 3
        return [rank_mapping[score] for score in score]