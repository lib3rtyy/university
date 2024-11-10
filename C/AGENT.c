#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#define MAX 26 

//-----------------Variables----------------//

int sentences=0,length=0,variables=0;
char *filename = "knowledge_base.txt";
    

//--------------Functions----------------//

void getComponents(){
	
	printf("Please enter the number of sentences [C] for the knowledge base: ");
    scanf("%d", &sentences);
    sentences++;
	
	printf("Please enter the maximum length [L] of each sentence: ");
    scanf("%d", &length);

	do{
	printf("Please enter the number of propositional variables [P] (maximum number is 26): ");
    scanf("%d", &variables);
	}while(variables>MAX);
	
}

void randomGenerator(char array[sentences][length]){
	
	int i,j,usageChance, negativityChance, arrayX=0, arrayY=0, AsciiChar;
	char temp[length],empty[length];
	bool sentenceExists=false;
	
	for(i=0;i<sentences;i++){
		for(j=0;j<length;j++){
			array[i][j]=32;
			temp[i]=32;
			empty[i]=32;
		}
	} //32 is ASCII value of space
	
	for(arrayX=0;arrayX<(sentences-1);arrayX++){
		
		for(i=0;i<variables;i++){
		
			usageChance = rand() % 2; //Generates a random number (0 or 1), 0 means the letter wont be used and 1 means the letter will be used
			negativityChance = rand() % 2; //Generates a random number (0 or 1), 0 means the letter wont be negative and 1 means the letter will be negative
			
				if(usageChance==1){
			
					AsciiChar=97+i; //97 in ASCII is 'a'
				
					if(negativityChance==1){
			
						AsciiChar=AsciiChar-32; //Upper and lower case letters in ASCII have a difference of 32 in value
					
					}
			
					array[arrayX][arrayY]=AsciiChar;
					//temp[arrayY]=AsciiChar;
					arrayY++;
			
				}
		
			}
			
		/*for(j=0;j<sentences;j++){
			if(temp==array[j]){
				sentenceExists=true;
				strcpy(array[j],empty);
				printf("Duplicate found\n");
			}
		}*/	
		
		//arrayX--;
		arrayY=0;
		
	}

}

void sentencesAndInput(char array[sentences][length]){
	
	FILE *fp = fopen(filename, "w");
	char lectical;
	
	int i,j;
	
	printf("Insert a lectical : ");
	fflush(stdin);
	scanf("%c",&lectical);
	array[sentences-1][0]=lectical-32;
	
	fprintf(fp,"[C]:%d [L]:%d [P]:%d \n",sentences-1,length,variables);
	for(i=0;i<sentences;i++){
		for(j=0;j<length;j++){
			fprintf(fp,"%c ",array[i][j]);
		}
		fprintf(fp,"\n");
	}
	
	fclose(fp);
}

void GSAT(char array[sentences][length], int maxFlips, int maxTries, int sentences){
	
	int i,j,k,l,score=sentences,tempScore=0,sameScoreChance;
	int assignments[variables], tempAssignments[variables];
	bool GSATsuccess;
	
	//GSAT retry loop
	for(i=0;i<maxTries;i++){
			
		if(score>0){
			//Assignment loop | 0=false - 1=true
			for(j=0;j<variables;j++){
				assignments[j] = rand() % 2;
				tempAssignments[j]=assignments[j];
			}
	
			//Flip loop
			for(j=0;j<maxFlips;j++){
			
				//Temporary flips to check which lectical lowers the score the most
				for(k=0;k<variables;k++){
				
					if(tempAssignments[k]==1)
						tempAssignments[k]=0;
					else if(tempAssignments[k]==1)
						tempAssignments[k]=0;
				
					if(tempFlip(array,tempAssignments)<score){
						score=tempFlip(array,tempAssignments);
						for(l=0;l<length;l++){
							assignments[l]=tempAssignments[l];
						}
					}
					else if(tempFlip(array,tempAssignments)==score){//Random chance to keep variable assignments in case they result in the same score
						sameScoreChance = rand() % 2;
						if(sameScoreChance==1){
							score=tempFlip(array,tempAssignments);
							for(l=0;l<length;l++){
								assignments[l]=tempAssignments[l];
							}
						}
					}
					else{//Recover true-false values in case a lower score isn't found
						if(tempAssignments[k]==1)
							tempAssignments[k]=0;
						else if(tempAssignments[k]==1)
							tempAssignments[k]=0;
					}
				
				}
			
			}
		
		}
	}
	
	if(score==0)
		printf("GSAT was succesful. No entailment\n");
	else
		printf("GSAT unsuccessful\n");
	
}

int tempFlip(char array[sentences][length], int tempAssignments[variables]){
	
	int i,j,tempScore=sentences;
	bool sentenceResult=false;
	
	for(i=0;i<sentences;i++){		
		for(j=0;j<length;j++){
			if(array[i][j]>=97 && array[i][j]<=122){ //Positive + True
				if(tempAssignments[array[i][j]-97]==1)
					sentenceResult=true;
				//printf("%d-%c\n",tempAssignments[(array[i][j]-97)],array[i][j]);
			}
			else if(array[i][j]<=90 && array[i][j]>=65){ //Negative + False
				if(tempAssignments[array[i][j]-65]==0)
					sentenceResult=true;
				//printf("%d-%c\n",tempAssignments[(array[i][j]-65)],array[i][j]);
			} 
		}
		
		if(sentenceResult==true){
			tempScore--;
			sentenceResult=false;
			//printf("score=%d\n",tempScore);
		}
	}

	return tempScore;
	
}

void resolution(char array[sentences][length]){
	
	char result[length], discarded[length];
	int i,j,k,index=0;
	bool foundOpposites=false, foundDuplicate=false, writtenCheck=false;
	
	//Fills results with spaces for later checks
	for(i=0;i<sentences;i++){
			result[i]=32;
	}
	
	//Result of first two sentences		
	for(j=0;j<length;j++){
		for(k=0;k<length;k++){
				
		if(array[0][j]==array[1][k]+32 || array[0][j]==array[1][k]-32)
				foundOpposites=true;
			
		}
			
		if(foundOpposites==true){
			foundOpposites=false;
			discarded[index]=array[0][j];
			index++;
		}
		else
			result[index-1]=array[0][j];
			
	}	
		
	for(j=0;j<length;j++){
		for(k=0;k<length;k++){
				
			if(array[1][j]==result[k] || array[1][j]==discarded[k] || array[1][j]==discarded[k]-32 || array[i+1][j]==discarded[k]+32)
				foundDuplicate=true;
		
		}
			
		if(foundDuplicate==true)
			foundDuplicate=false;
		else{
			for(k=0;k<length;k++){
				if(result[k]==32 && writtenCheck==false){
					result[index]=array[1][j];
					writtenCheck=true;
					index++;
				}
			}
		}
				
		writtenCheck=false;
			
	}
	index=0;
		
	for(j=0;j<length;j++){
		discarded[j]=32;
	}
		
	for(i=0;i<sentences;i++){
		printf("%c ",result[i]);
	}
	printf("\n----------------------------------\n");

	//Results of previous result AND next sentence
	for(i=2;i<sentences;i++){
		for(j=0;j<length;j++){
			for(k=0;k<length;k++){
				
			if(array[i][j]==result[k]+32 || array[i][j]==result[k]-32)
					foundOpposites=true;
			
			}
			
			if(foundOpposites==true){
				foundOpposites=false;
				result[k]=32;
				discarded[index]=array[i][j];
				index++;
			}
			
		}	
		
		for(j=0;j<length;j++){
			for(k=0;k<length;k++){
				
				if(array[i][j]==result[k] || array[1][j]==discarded[k] || array[i][j]==discarded[k]-32 || array[i][j]==discarded[k]+32)
					foundDuplicate=true;
		
			}
			
			if(foundDuplicate==true)
				foundDuplicate=false;
			else{
				for(k=0;k<length;k++){
					if(result[k]==32 && writtenCheck==false){
						result[k]=array[1][j];
						writtenCheck=true;
					}
				}
			}
				
			writtenCheck=false;
			
		}
		index=0;
			
		for(j=0;j<length;j++){
			discarded[j]=32;
		}
			
		for(i=0;i<sentences;i++){
			printf("%c ",result[i]);
		}
		printf("\n----------------------------------\n");
		
		
	}
	
	
	if(result==NULL){
		printf("Lectical is entailed by the knowledge base");
	}
	else{
		printf("Resolution result : %s. Lectical not entailed",result);
	}
	
}	
	

int main(int argc, char *argv[]) {
	
	int flips, tries;
	
	getComponents();
	char CL[sentences+1][length];
	
	randomGenerator(CL);
	sentencesAndInput(CL);
	
	printf("Give maximum numbers of variable flips for GSAT : ");
	scanf("%d",&flips);
	printf("Give maximum numbers of retries for GSAT : ");
	scanf("%d",&tries);
	
	GSAT(CL,flips,tries,sentences);
	resolution(CL);
		
	return 0;
}
