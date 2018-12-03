#include<iostream>
#include<ctime>
#include<cstdio>
#include<cstdlib>
#include<cstring>

#define For(i,l,r) for(int i = l; i <= r; ++i)

using namespace std;

const int Maxn = 32;
const int Mod = 2;

int main()
{
	freopen("data.txt","w",stdout);
	srand(time(0));
	For(i,1,Maxn)
	{
		For(j,1,Maxn)
			cout<<rand()%Mod;
		puts("");
	}
	
	return 0;
}
