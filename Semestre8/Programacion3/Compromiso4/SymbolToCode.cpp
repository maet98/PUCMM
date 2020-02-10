#include<bits/stdc++.h>

using namespace std;

int main(){
    vector<vector<string>>a;
    ifstream ent;
    ent.open("simbols.txt");
    ofstream sal;
    sal.open("switch.txt");
    string x,y;
    while(ent >> x){
        ent >> y;
        if(y[0] == '-'){
            y = x;
            y.erase(y.begin());
        }
        sal << "case "<< x << ":" << endl;
        sal << "    return "<<'"' << y << '"'<< ';' << endl;
        sal << "    break;"<< endl;
    }
    ent.close();
    sal.close();
}