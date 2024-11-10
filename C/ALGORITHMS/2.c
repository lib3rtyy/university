#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int puzzle1(int piecesAvailable, int piecesNeeded, int levelsCompleted){
	
	if(piecesAvailable>=piecesNeeded){
		levelsCompleted++;
		piecesAvailable-=piecesNeeded;
		piecesNeeded=pow((levelsCompleted+levelsCompleted+1),2)-pow((levelsCompleted+levelsCompleted-1),2);
		puzzle1(piecesAvailable,piecesNeeded,levelsCompleted);
	}
	else{
		printf("--------------------Puzzle1-----------------\n\n");
		printf("You can complete %d levels with your puzzle pieces\n\n",levelsCompleted);
	}
	
}

void puzzle2(int piecesAvailable, int piecesNeeded, int levelsCompleted){
	
	printf("--------------------Puzzle2-----------------\n\n");
	
	while(piecesAvailable>=piecesNeeded){
		levelsCompleted++;
		piecesAvailable-=piecesNeeded;
		piecesNeeded=pow((levelsCompleted+levelsCompleted+1),2)-pow((levelsCompleted+levelsCompleted-1),2);
	}
	
	printf("You can complete %d levels with your puzzle pieces\n",levelsCompleted);
	
}

int main(int argc, char *argv[]) {
	
	int piecesAvailable, piecesNeeded=1, levelsCompleted=0;;
	
	do{
		printf("How many puzzle pieces do you have?\n");
		scanf("%d",&piecesAvailable);
		printf("\n\n");
	}while(piecesAvailable<=0);
	
	puzzle1(piecesAvailable,piecesNeeded,levelsCompleted);
	puzzle2(piecesAvailable,piecesNeeded,levelsCompleted);
	
	return 0;
}
