#include "Box.h"
#include <string>
#include <iostream>
using namespace std;

Box::Box(){};

Box::Box(float h, float w, float l, string c)
{
	height=h;
	width=w;
	length=l;
	color=c;
};

void Box::setData(float h, float w, float l, string c)
{
	height=h;
	width=w;
	length=l;
	color=c;
};

void Box::readData()
{
	cout<<"Enter height"<<endl;
	cin>>height;
	cout<<"Enter width"<<endl;
	cin>>width;
	cout<<"Enter length"<<endl;
	cin>>length;
	cout<<"Enter color"<<endl;
	cin>>color;
};

void Box::printData()
{
	cout<<"The dimensions of the box are: length="<<length<<endl;
	cout<<"width="<<width<<endl;
	cout<<"length"<<length<<endl;
	cout<<"and with color="<<color<<endl;
};

float Box::calcVol()
{
	return width*height*length;
};

string Box::retCol()
{
	return color;
}
