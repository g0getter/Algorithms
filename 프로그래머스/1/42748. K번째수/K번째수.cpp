#include <string>
#include <vector>
#include <iostream>
#include <algorithm> // sort 때문에

using namespace std;

vector<int> solution(vector<int> array, vector<vector<int>> commands) {
    vector<int> answer;
    
    for (vector<int> command : commands) {
        int i = command[0];
        int j = command[1];
        int k = command[2];
        // 1. 자름
        vector<int> numbers(array.begin()+i-1, array.begin()+j);

        // 2. 정렬
        sort(numbers.begin(), numbers.end());
        // for (int num : numbers) {
        //     cout << num << endl;
        // }
        // cout << endl;
        
        // 3. N번째 숫자 pick
        answer.push_back(numbers[k-1]);
    }
    return answer;
}