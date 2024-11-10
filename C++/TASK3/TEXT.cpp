#include "TEXT.h"
#include <iostream>
#include <string>
#include <cstring> 
using namespace std;

Text::Text()
{
	
};

Text::Text(string v)
{
	value=v;
	int z=1;
    int i;
        //  metraei ton arithmo twn xarakthrw
	chars=value.length();
	
	
	
	for(i=0; i<value.length(); i++)    // metraei ton arithmo twn lexewn
	{
		if(value[i]==' ')
		
		z=z+1;
	}
	words=z;
	
};

ostream &operator<<( ostream &output, const Text &v )
{
	output <<"h leksh einai "<< v.value <<" , " <<"exei "<< v.words <<" lekseis"<< " , " << v.chars<<" , "<<"xarakthres"<<endl;
	return output;
};

bool operator>(const Text &v1,const Text &v2)
{
	if(v1.chars>v2.chars)
		return true;
	else
		return false;
		
};
Text operator+( Text t1,Text t2 )
{
	Text t3;
	string temp;
	
	temp.append(t1.value);
	temp.append(" ");
	temp.append(t2.value);
	
	t3.value=temp;
	t3.chars=t1.chars+t2.chars;
	t3.words=t1.words+t2.words;
	return t3;
};
