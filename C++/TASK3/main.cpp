#include <iostream>
#include "TEXT.h"
#include <string> 
using namespace std;

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main(int argc, char** argv) {
	
	Text t1("HELLO DARKNESS");
	Text t2("MY OLD FRIEND");
	Text t3;
	
	cout<<t1;
	cout<<t2;
	
	
	
	if(t1>t2)
	cout<<"h leksh t1 exei perissoterous xarakthres apo th t2"<<endl;
	else
	cout<<"h leksh t2 exei perissoterous xarakthres apo th t1"<<endl;
	
	t3=t1+t2;
	
	cout<<t3;
	
	
	return 0;
}

