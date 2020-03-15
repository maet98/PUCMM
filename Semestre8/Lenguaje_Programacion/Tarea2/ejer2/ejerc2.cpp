#include<bits/stdc++.h>

using namespace std;

int getId(string line, int pos){
	int first, last;
	int id = 0;
	first = last = -1;
	for(int i = 0;i < line.size() && last == -1;i++){
		if(line[i] == '"'){
			if(first == -1){
				first = i;
			}
			else if(last == -1){
				last = i;
			}
		}
		else if(first != -1 && line[i] >='0' && line[i] <='9'){
			id *= 10;
			id += line[i]-'0';
		}
	}
	return id;
}

int main(){
	int row;
	cout << "Inserte la fila a buscar" << endl;
	cin >> row;
	ifstream search;
	search.open("ejerc2.xml");
	string line;
	vector<string>validos = {"valor","semana","titulo","fecha"};
	while(search >> line){
		if(line.find("ord") != -1){
			int pos = line.find("ord");
			int id = getId(line, pos);
			if(row == id){
				cout << "id: " << id << endl;
				search >> line;
				while(line.find("</tr>")==-1){
					string res;
					res = line.substr(line.find(">") + 1);
					if(res == "")
						res = line.substr(0, line.find("<"));
					if(line.find("<") != 0 || line.find("<") == -1)
					{
						cout << " " << res.substr(0, res.find("<"));
					}
					else
						cout << endl<< line.substr(1, line.find(">") - 1) << " " << res.substr(0, res.find("<"));
					search >> line;
				}
			}
		}
	}
	search.close();
	return 0;
}
