#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

#define maze_size_x 11
#define maze_size_y 13

struct parentNode{
	int x;
	int y;
};

struct node{
	char type[6]; //Start,Space,Wall,Door,Goal
	struct parentNode parent;
	int pathCost;
	int depth;
	int x;
	int y;
	bool isFrontier;
};

struct node Start, Goal, currentPos;
struct node frontier[maze_size_x][maze_size_y];
bool goalFound=false;

/////////////////////////////////////////////////////////////////////
//                          STACK                                  //
/////////////////////////////////////////////////////////////////////

int MAXSIZE = maze_size_x*maze_size_y;       
struct node stack[maze_size_x*maze_size_y];     
int top = -1; 

int isempty() {

   if(top == -1)
      return 1;
   else
      return 0;
}
   
int isfull() {

   if(top == MAXSIZE)
      return 1;
   else
      return 0;
}

struct node pop() {
   struct node data;
	
   if(!isempty()) {
      data = stack[top];
      top = top - 1;   
      return data;
   } else {
      printf("Could not retrieve data, Stack is empty.\n");
   }
}

void push(struct node data) {

   if(!isfull()) {
      top = top + 1;   
      stack[top] = data;
   } else {
      printf("Could not insert data, Stack is full.\n");
   }
}

/////////////////////////////////////////////////////////////////////
//                          UCS
/////////////////////////////////////////////////////////////////////

					  
void print_maze(int maze_rows, int maze_cols, char maze[][maze_size_y]) { //Prints the maze and gets start and goal nodes

	int i, j;

	for (i = 0; i < maze_size_x; i++) {
		for (j = 0; j < maze_size_y; j++) {
			printf("%c ", maze[i][j]);
			if (maze[i][j] == 'S') {
				strcpy(Start.type,"Start");
				Start.x = i;
				Start.y = j;
				Start.pathCost = 0;
				Start.depth = 0;
				Start.isFrontier = false;
				frontier[Start.x][Start.y] = Start;
				currentPos = Start;
			}
			if (maze[i][j] == 'G') {
				Goal.x = i;
				Goal.y = j;
			}
		}
		printf("\n");
	}
	
	printf("\nStart node is [%d][%d]\n",Start.x,Start.y);
	printf("Goal node is [%d][%d]\n",Goal.x,Goal.y);

}

void create_empty_frontier(struct node emptyNode){
	
	int i,j;
	for (i = 0; i < maze_size_x; i++) {
		for (j = 0; j < maze_size_y; j++) {
			frontier[i][j] = emptyNode;
		}
	}
	
}

void check_type(char toBeChecked, int xcoord, int ycoord){
	
	switch(toBeChecked)
	{
		case 'O':
			strcpy(frontier[xcoord][ycoord].type,"Space");
			frontier[xcoord][ycoord].parent.x=currentPos.x;
			frontier[xcoord][ycoord].parent.y=currentPos.y;
			frontier[xcoord][ycoord].pathCost=currentPos.pathCost+1;
			frontier[xcoord][ycoord].depth=currentPos.depth+1;
			frontier[xcoord][ycoord].x=xcoord;
			frontier[xcoord][ycoord].y=ycoord;
			frontier[xcoord][ycoord].isFrontier=true;
			break;
		case 'X':
			strcpy(frontier[xcoord][ycoord].type,"Wall");
			frontier[xcoord][ycoord].x=currentPos.x;
			frontier[xcoord][ycoord].y=currentPos.y;
			frontier[xcoord][ycoord].isFrontier=false;
			break;
		case 'D':
			strcpy(frontier[xcoord][ycoord].type,"Door");
			frontier[xcoord][ycoord].parent.x=currentPos.x;
			frontier[xcoord][ycoord].parent.y=currentPos.y;
			frontier[xcoord][ycoord].pathCost=currentPos.pathCost+2;
			frontier[xcoord][ycoord].depth=currentPos.depth+1;
			frontier[xcoord][ycoord].x=xcoord;
			frontier[xcoord][ycoord].y=ycoord;
			frontier[xcoord][ycoord].isFrontier=true;
			break;
		case 'G':
			strcpy(frontier[xcoord][ycoord].type,"Goal");
			frontier[xcoord][ycoord].parent.x=currentPos.x;
			frontier[xcoord][ycoord].parent.y=currentPos.y;
			frontier[xcoord][ycoord].pathCost=currentPos.pathCost+1;
			frontier[xcoord][ycoord].depth=currentPos.depth+1;
			frontier[xcoord][ycoord].x=xcoord;
			frontier[xcoord][ycoord].y=ycoord;
			frontier[xcoord][ycoord].isFrontier=true;
			break;
	}
	
}

void generate_frontier(char map[maze_size_x][maze_size_y]){

	//Up
	if(strcmp(frontier[currentPos.x-1][currentPos.y].type,"Blank")==0 && currentPos.x-1>=0){
		check_type(map[currentPos.x-1][currentPos.y],currentPos.x-1,currentPos.y);
	}

	//Down
	if(strcmp(frontier[currentPos.x+1][currentPos.y].type,"Blank")==0 && currentPos.x+1>=0){
		check_type(map[currentPos.x+1][currentPos.y],currentPos.x+1,currentPos.y);
	}
	
	//Right
	if(strcmp(frontier[currentPos.x][currentPos.y+1].type,"Blank")==0 && currentPos.y+1>=0){
		check_type(map[currentPos.x][currentPos.y+1],currentPos.x,currentPos.y+1);
	}
	
	//Left
	if(strcmp(frontier[currentPos.x][currentPos.y-1].type,"Blank")==0 && currentPos.y-1>=0){
		check_type(map[currentPos.x][currentPos.y-1],currentPos.x,currentPos.y-1);
	}

}

void atGoal(){
	
	if(currentPos.x==Goal.x && currentPos.y==Goal.y){
		goalFound=true;
	}
	
}

void moveToMinCost(){ //Finds minimum path cost node in frontier and switches currentPos, natural priority from top left to bottom right
	
	int i,j,minx,miny,min=999;
	for (i = 0; i < maze_size_x; i++) {
		for (j = 0; j < maze_size_y; j++) {
			if(frontier[i][j].pathCost<min && frontier[i][j].isFrontier==true){
				min=frontier[i][j].pathCost;	
				currentPos=frontier[i][j];
				minx=i;
				miny=j;
			}
		}
	}
	
	frontier[minx][miny].isFrontier=false;
	
}

/*void printSolution(){
	
	int count,i=Goal.x,j=Goal.y,switchLineCount=0;
	struct node tracingNode;

	while(!(i==Start.x && j==Start.y)){
		push(frontier[i][j]);
		i=frontier[i][j].parent.x;
		j=frontier[i][j].parent.y;
		count++;
		printf("[%d][%d]\n",stack[count].x,stack[count].y);
	}
	
	while(!isempty){
		tracingNode=pop();
		printf("[%d][%d]->",tracingNode.x,tracingNode.y);
		switchLineCount++;
		if(switchLineCount==5){
			switchLineCount=0;
			printf("\n");
		}
	}
	
	printf("SUCCESS\n");
	
}*/

int heuristic(struct node currentPos,struct node Goal)
{
	int dx,dy,min;
	int minimumCost=1;

	dx = abs(currentPos.x - Goal.x);
	dy = abs(currentPos.y - Goal.y);
	
	
	if(dx< dy)
		min=dx;
	else
		min=dy;
		
	return minimumCost * (dx+dy) - (2*minimumCost)*min;
}


void UCS(char map[maze_size_x][maze_size_y]){
	
	int numOfNodesExplored=0;
	struct node emptyNode={.type="Blank", .isFrontier=false}; //Used only to empty frontier
	create_empty_frontier(emptyNode);
	print_maze(maze_size_x, maze_size_y, map);
	
	printf("UCS EXPLORATION\n");
	while(goalFound==false){
		generate_frontier(map);
		moveToMinCost();
		atGoal();
		printf("[%d][%d]\n",currentPos.x,currentPos.y);
		numOfNodesExplored++;
		
	}

	printf("Path cost to goal: %d\n",currentPos.pathCost);
	printf("Number of nodes explored: %d\n",numOfNodesExplored);

	//printSolution();
	
}

/*void A_star(char map[maze_size_x][maze_size_y])
{
	int numOfNodesExplored=0;
	int result=0,currentHeuristic=0;
	int score;
	struct node emptyNode={.type="Blank", .isFrontier=false}; //Used only to empty frontier
	create_empty_frontier(emptyNode);
	

	printf("A* EXPLORATION\n");
		while(goalFound==false){
		generate_frontier(map);
		moveToMinCost();
		heuristic(currentPos,Goal);
		atGoal();
		score=currentHeuristic+currentPos.pathCost;
		printf("[%d][%d]\n",currentPos.x,currentPos.y);
		numOfNodesExplored++;
		
	}

	printf("Path cost to goal: %d\n",currentPos.pathCost);
	printf("Number of nodes explored: %d\n",numOfNodesExplored);
	printf("Score: %d\n",score);
	
}*/

int main(int argc, char *argv[]) {
	
	char map[maze_size_x][maze_size_y] = {"SOXOOOOXXOXOX",
										  "OOODXOOOOODOX",
										  "XOXOOOOXXOXOX",
									      "OODXODXOODOOO",
										  "XXOOXOOOXXXXO",
										  "ODOXOXOOXXOOO",
										  "XODXOXXDOODXD",
										  "OXOODOOOXOOOO",
										  "OODOOXXOXXXXO",
										  "XXOOOOXOOOOOD",
										  "XXOXXOODXXXOG"};
					  
	UCS(map);
	//printf("==========================\n");
	//A_star(map);
	
	return 0;
}
