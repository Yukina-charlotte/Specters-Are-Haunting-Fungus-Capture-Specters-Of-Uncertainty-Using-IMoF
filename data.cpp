#include<iostream>
#include<cstring>
#include<cstdio>
#include<algorithm>
#include<cmath>
#include<ctime>
using namespace std;

#define DB double
int n,ty;
DB x,y;

int main()
{
	//freopen("data.in","w",stdout);
	srand((unsigned)time(NULL));
	n=rand()%10+13;
	printf("%d\n",n);
	int L=10000;
	for (int i=1;i<=n;i++)
	{
		if (i>13) ty=rand()%13+1;
			else ty=i;
		x=(DB)(rand()%L)/100.0;
		y=(DB)(rand()%L)/100.0;
		printf("%lf %lf %d\n",x,y,ty);
	}
	return 0;
}