#include "Client.h"
#include <iostream>
#include <string>
using namespace std;


int main(int argc, char** argv) {
 Client c1,c2;
 c1.readData();
 c2.readData();
 
 c1.printData();
 c2.printData();
 
 c1.maxDep();
 c2.maxDep();
 
 if (c1.mCompDep(c2)==true)
 {
 	cout<<"Client 1 has the greatest sum of deposits and his data is:"<<endl;
 	c1.printData();
 }
    else 
    {
    cout<<"Client 2 has the greatest sum of deposits and his data is:"<<endl;
    c2.printData();
    }
	
	
	if (fCompDep(c1,c2))
	{
 	cout<<"Client 1 has the greatest sum of deposits and his data is:"<<endl;
 	c1.printData();
    }
    else 
    {
    cout<<"Client 2 has the greatest sum of deposits and his data is:"<<endl;
    c2.printData();
    }
	
	
	return 0;
}
