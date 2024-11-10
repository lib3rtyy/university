package com.mycompany.tnproject2;

import java.util.ArrayList;
import java.util.Random;

public class GSAT_RW {
    
    int maxFlips;
    int maxTries;
    int[][] CNFprob;
    int probability;
    
    public GSAT_RW(int maxFlips, int maxTries, int[][] CNFprob, int probability){
        
        this.maxFlips = maxFlips;
        this.maxTries = maxTries;
        this.CNFprob = CNFprob;
        this.probability = probability;
        
    }
    
    public int checkClause(int[] CNFclause, int[] variableAssignments){
        
        int[] results = new int[3];
        
        for(int i=0;i<3;i++){
            
            if(variableAssignments[Math.abs(CNFclause[i])-1]==1 && CNFclause[i]>0)
                results[i]=1;
            else if(variableAssignments[Math.abs(CNFclause[i])-1]==0 && CNFclause[i]>1)
                results[i]=1;
            else 
                results[i]=0;
                
        }
        
        if(results[0]==1 || results[1]==1 || results[2]==1)
            return 0;
        else
            return 1;
        
    }
    
    public int findBestFlip(int[] variableAssignments, int nofSymbols, int nofClauses, int currentScore){
        
        int[] tempAssignments = variableAssignments;
        int bestVariable = 0, tempScore = 0, tempBestScore = currentScore;
        
        for(int i=0;i<nofSymbols;i++){
            
            if(tempAssignments[i]==0)
                tempAssignments[i]=1;
            else if(tempAssignments[i]==1)
                tempAssignments[i]=0;
            
            for(int k=0;k<nofClauses;k++){ //Loop to compute score
                    
                tempScore = tempScore + checkClause(CNFprob[k],tempAssignments);
                //System.out.println("tempScore: " + tempScore);
            }
            //System.out.println("Next test flip");
            if(tempScore<=tempBestScore){
                tempBestScore = tempScore;
                bestVariable = i;
            }
            
            tempAssignments = variableAssignments;
            tempScore = 0;
            
        }
        
        if(variableAssignments[bestVariable]==0)
            variableAssignments[bestVariable]=1;
        else if(variableAssignments[bestVariable]==1)
            variableAssignments[bestVariable]=0;
        
        return tempBestScore;
        
    }
    
    public int randomWalk(int nofClauses, int[] variableAssignments){
        
        ArrayList<int[]> falseClauses = new ArrayList<int[]>();
        int[] randomClause = new int[3];
        int randomLectical, newScore = 0;
        Random rand = new Random();
        
        for(int i=0;i<nofClauses;i++){
            
            if(checkClause(this.CNFprob[i],variableAssignments)==1)
                falseClauses.add(this.CNFprob[i]);
            
        }
        
        randomClause = falseClauses.get(rand.nextInt(falseClauses.size()));
        
        randomLectical = randomClause[rand.nextInt(3)];
        
        if(variableAssignments[Math.abs(randomLectical)-1]==0)
            variableAssignments[Math.abs(randomLectical)-1]=1;
        else if(variableAssignments[Math.abs(randomLectical)-1]==1)
            variableAssignments[Math.abs(randomLectical)-1]=0;
        
        for(int i=0;i<nofClauses;i++){
            
            newScore = newScore + checkClause(CNFprob[i],variableAssignments);
            
        }
        
        return newScore;
        
    }
    
    public void printResult(int nofSymbols, int currentScore, int[] variableAssignments){
        
        System.out.println("---Current Variable Assignments with a score of " + currentScore + "---");
        for(int i=0;i<nofSymbols;i++){
            System.out.print(i+1 + " ");
        }
        System.out.println();
        for(int i=0;i<nofSymbols;i++){
            System.out.print(variableAssignments[i] + " ");
        }
        System.out.println();
        
    }
    
    public void GSAT_RWalgo(int nofSymbols, int nofClauses, int[] variableAssignments){
        
        int currentScore = 0;
        Random rand = new Random();
        
        for(int i=0;i<this.maxTries;i++){ //Loop to start again with new assignments
            
            for(int k=0;k<nofClauses;k++){ //Loop to compute score
                    
                    currentScore = currentScore + checkClause(this.CNFprob[k],variableAssignments);
                    //System.out.println("tempScore: " + currentScore);
                    
            }
            //System.out.println("Flips starting");
            printResult(nofSymbols,currentScore,variableAssignments);
            
            if(currentScore==0)
                break;
            
            for(int j=0;j<this.maxFlips;j++){ //Loop for flip
                
                if(rand.nextInt(100/this.probability)==0){
                    System.out.println("Random walk");
                    currentScore = randomWalk(nofClauses,variableAssignments);
                }
                else{
                    System.out.println("Regular flip");
                    currentScore = findBestFlip(variableAssignments,nofSymbols,nofClauses,currentScore);
                }
                               
                if(currentScore==0)
                    break;
                
                printResult(nofSymbols,currentScore,variableAssignments);
                
            }
            
            if(currentScore==0)
                break;
            
        }
        
    }
    
}
