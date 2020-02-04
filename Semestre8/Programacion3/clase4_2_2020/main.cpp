#include<bits/stdc++.h>

using namespace std;

bool fun2(stack<char>&st, string&s, int i, bool found){
    if(i == s.size()) return st.empty();
    if(s[i] == 'a'){
        if(!found){
            st.push('a');
            fun2(st,s,i+1,found);
        }
        else{
            return false;
        }
    }
    else{
        if(st.empty())return false;
        st.pop();
        fun2(st,s,i+1,true);
    }
}

bool fun(string s){
    bool found = false;
    stack<char> x;
    for(int i = 0; i < s.length(); i++){
        if(s[i] == 'a'){
            if(!found){
                x.push('a');
            }else{
                return false;
            }
        }else{
            if(x.empty()) return false;
            found = true;
            x.pop();
        }
         
    }
    return (x.empty());
}
/*
bool fun(string s){
    int i = 0;
    while(s[i] == 'a')i++;
    while(s[i] == 'b')i++;

    stack<int> x;
    for(int i = 0; i < s.length(); i++){
        if(!x.empty()){
            if(s[i] == 'a'){
                return 0;
            }else{
                x.push(x.top() - 1);
            }
        }else{
            if(s[i] == 'b'){
                x.push(i + 1);
            }
        }
    }
    return (x.top() == 0);
}
*/

int main(){
    while(true){
        string s;
        cin >> s;
        stack<char>st;
        cout << fun2(st,s,0,false) << endl;
    }
    return 0;
}