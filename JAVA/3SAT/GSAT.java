package com.mycompany.tnproject2;

import java.util.Random;

public class GSAT{
    
    int maxFlips;
    int maxTries;
    int[][] CNFprob;
    
    public GSAT(int maxFlips, int maxTries, int[][] CNFprob){
        
        this.maxFlips = maxFlips;
        this.maxTries = maxTries;
        this.CNFprob = CNFprob;
        
    }
    
    public int checkClause(int[] CNFclause, int[] variableAssignments){
        
        int[] results = new int[3];
        
        for(int i=0;i<3;i++){
            
            if(variableAssignments[Math.abs(CNFclause[i])-1]==1 && CNFclause[i]>0)
                results[i]=1;
            else if(variableAssignments[Math.abs(CNFclause[i])-1]==0 && CNFclause[i]<0)
                results[i]=1;
            else 
                results[i]=0;
   
        }
        
        if(results[0]==1 || results[1]==1 || results[2]==1){
            //System.out.print(0);
            return 0;
        }
        else{
            //System.out.print(1);
            return 1;
        }
        
    }
    
    public int findBestFlip(int[] variableAssignments, int nofSymbols, int nofClauses, int currentScore, int[][] CNFproblem){
        
        int[] tempAssignments = variableAssignments;
        int bestVariable = 0, tempScore = 0, tempBestScore = currentScore;
        
        for(int i=0;i<nofSymbols;i++){
            
            if(tempAssignments[i]==0)
                tempAssignments[i]=1;
            else if(tempAssignments[i]==1)
                tempAssignments[i]=0;
            
            for(int k=0;k<nofClauses;k++){ //Loop to compute score
                    
                tempScore = tempScore + checkClause(CNFproblem[k],tempAssignments);
                //System.out.println("tempScore: " + tempScore);
            }
            //System.out.println("Next test flip");
            if(tempScore<=tempBestScore){
                tempBestScore = tempScore;
                bestVariable = i;
            }
            
            tempAssignments = variableAssignments;
            tempScore = 0;
            
            for(int j=0;j<nofSymbols;j++){
                System.out.print(variableAssignments[j] + " ");
        }
            
        }
        
        if(variableAssignments[bestVariable]==0)
            variableAssignments[bestVariable]=1;
        else if(variableAssignments[bestVariable]==1)
            variableAssignments[bestVariable]=0;
        
        return tempBestScore;
        
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
    
    public void GSATalgo(int nofSymbols, int nofClauses, int[] variableAssignments){
        
        int currentScore = 0;
        
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
                
                currentScore = findBestFlip(variableAssignments,nofSymbols,nofClauses,currentScore,this.CNFprob);
                //System.out.println(currentScore);
                printResult(nofSymbols,currentScore,variableAssignments);
                if(currentScore==0)
                    break;
                
            }
            
            if(currentScore==0)
                break;
            
        }
        
    }
    
}
