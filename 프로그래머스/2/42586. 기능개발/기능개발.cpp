#include <string>
#include <vector>
#include <queue>
#include <iostream>

using namespace std;

vector<int> solution(vector<int> progresses, vector<int> speeds) {
    // 1. 남은 일수 세고
    // 2. (사실상 오름차순 탐색) previous index(prev_idx) 저장해둔 후,
    //    arr[prev_idx] <= current이면 index 차이만큼 answer에 append
    vector<int> answer;
    vector<int> remaining_days; // 끝나기까지 남은 일수
    
    // 1. 남은 일수 세고 vector에 넣기
    for (int i=0; i < progresses.size(); ++i) { 
        int remain = 100 - progresses[i];
        int days_to_need = (remain + speeds[i] - 1) / speeds[i]; // 올림!!
        // cout << days_to_need << endl;
        remaining_days.push_back(days_to_need);
    }
    
    // 2. previous index(prev_idx) 저장해둔 후,
    //    arr[prev_idx] < current이면 index 차이만큼 answer에 append
    int prev_idx = 0;
    for (int i; i < remaining_days.size(); ++i) {
        if (remaining_days[i] > remaining_days[prev_idx]) {
            answer.push_back(i-prev_idx);
            prev_idx = i;
        }
    }
    answer.push_back(remaining_days.size()-prev_idx);
    
    return answer;
}