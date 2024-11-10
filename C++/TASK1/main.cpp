#include "Box.h"
#include <iostream>
#include <string>
using namespace std;

int main(int argc, char** argv) {
	Box b1,b2,b3(10.5,15.6,13.4,"Red"),b4(13.5,17.8,13.8,"Yellow");
	b1.setData(19.4,14.6,17.6,"White");
	b2.readData();
	
	b1.printData();
	b2.printData();
	b3.printData();
	b4.printData();
	
	if (b1.calcVol()>b2.calcVol())
		cout<<"b1 has a larger volume and it has the color: "<<b1.retCol()<<endl;
	else
		cout<<"b2 has a larger volume and it has the color: "<<b2.retCol()<<endl;
	
	cout<<"the sum of all volumes is: "<<b1.calcVol()+b2.calcVol()+b3.calcVol()+b4.calcVol()<<endl;
	

	
	return 0;
}
