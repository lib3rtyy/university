#include "Client.h"
#include <iostream>
#include <string>
using namespace std;

Client::Client(){};

Client::Client(string n,int d[5])
{
	name=n;
	for (int i=0;i<5;i++)
	{
		deposits[i]=d[i];
	}
};

void Client::readData()
{
	cout<<"Enter the client's name"<<endl;
	getline(cin,name);
	
	
	for (int i=0;i<5;i++)
	{
		cout<<"Give the deposite "<<i+1<<endl;
		cin>>deposits[i];
	}
    fflush(stdin);
};

void Client::printData()
{
	cout<<"The client is named: "<<name;
	cout<<"And his deposits are:";
	for (int i=0;i<5;i++)
	{
		cout<<deposits[i]<<",";
	}
	cout<<endl;
};

int Client::depSum()
{
	int sum;
	for (int i=0;i<5;i++)
	{
		sum+=deposits[i];
	}
	return sum;
};

int Client::maxDep()
{
	int max=deposits[0];
	for (int i=1;i<5;i++)
	{
		if (deposits[i]>max)
			max=deposits[i];
	}
	return max;
};


bool Client::mCompDep(Client c)
	{
		if (this->depSum()>c.depSum())
		return true;
		else 
		return false;
	}

bool fCompDep(Client c1,Client c2)	
	{
		if (c1.depSum()>c2.depSum())
	    return true;
	    else
	    return false;
	}
