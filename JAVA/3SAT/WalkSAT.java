package com.mycompany.tnproject2;

import java.util.ArrayList;
import java.util.Random;

public class WalkSAT {
    
    int maxFlips;
    int maxTries;
    int[][] CNFprob;
    int probability;
    
    public WalkSAT(int maxFlips, int maxTries, int[][] CNFprob, int probability){
        
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
    
    public int heuristic(int nofClauses, int[] variableAssignments, int currentScore){
        
        ArrayList<int[]> falseClauses = new ArrayList<int[]>();
        ArrayList<Integer> lecticals = new ArrayList<Integer>();
        int[] randomClause = new int[3];
        int[] tempScores = new int[3];
        int[] tempAssignments = variableAssignments;
        int randomLectical, tempScore = 0;
        Random rand = new Random();
        
        for(int i=0;i<nofClauses;i++){
            
            if(checkClause(this.CNFprob[i],variableAssignments)==1)
                falseClauses.add(this.CNFprob[i]);
            
        }
        
        randomClause = falseClauses.get(rand.nextInt(falseClauses.size()));
        
        for(int i=0;i<3;i++){
            
            if(tempAssignments[Math.abs(i)]==0)
                tempAssignments[Math.abs(i)]=1;
            else if(tempAssignments[Math.abs(i)]==1)
                tempAssignments[Math.abs(i)]=0;
            
            for(int k=0;k<nofClauses;k++){ //Loop to compute score
                    
                tempScore = tempScore + checkClause(randomClause,tempAssignments);
                
            }
            
            tempScores[i] = tempScore;
            
            if(tempScore<currentScore)
                lecticals.add(randomClause[i]);
            
            tempAssignments = variableAssignments;
            tempScore = 0;
            
        }
        
        if(!lecticals.isEmpty()){
            
            randomLectical = lecticals.get(rand.nextInt(3));
        
            if(variableAssignments[Math.abs(randomLectical)-1]==0)
                variableAssignments[Math.abs(randomLectical)-1]=1;
            else if(variableAssignments[Math.abs(randomLectical)-1]==1)
                variableAssignments[Math.abs(randomLectical)-1]=0;

            for(int k=0;k<nofClauses;k++){ //Loop to compute score

                tempScore = tempScore + checkClause(CNFprob[k],variableAssignments);

            }

            return tempScore;
            
        }
        else{
            
            if(rand.nextInt(100/this.probability)==0){
                
                int i = rand.nextInt(3);
                randomLectical = randomClause[i];
                tempScore = tempScores[i];
                
                if(variableAssignments[Math.abs(randomLectical)-1]==0)
                    variableAssignments[Math.abs(randomLectical)-1]=1;
                else if(variableAssignments[Math.abs(randomLectical)-1]==1)
                    variableAssignments[Math.abs(randomLectical)-1]=0;
                
                return tempScore;
                
            }
            else{
                
                int i;
                
                if(tempScores[0]<tempScores[1]){
                    tempScore = tempScores[0];
                    i = 0;
                }
                    
                else{
                    tempScore = tempScores[1];
                    i = 1;
                }
                                
                if(tempScores[2]<tempScore){
                    tempScore = tempScores[2];
                    i = 2;
                }
                    
                randomLectical = randomClause[i];
                
                if(variableAssignments[Math.abs(randomLectical)-1]==0)
                    variableAssignments[Math.abs(randomLectical)-1]=1;
                else if(variableAssignments[Math.abs(randomLectical)-1]==1)
                    variableAssignments[Math.abs(randomLectical)-1]=0;
            
                return tempScore;
                
            }
            
            
            
        }
        
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
    
    public void WalkSATalgo(int nofSymbols, int nofClauses, int[] variableAssignments){
        
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
                
                heuristic(nofClauses,variableAssignments,currentScore);
                               
                if(currentScore==0)
                    break;
                
                printResult(nofSymbols,currentScore,variableAssignments);
                
            }
            
            if(currentScore==0)
                break;
            
        }
        
    }
    
}
