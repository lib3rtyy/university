package com.mycompany.tnproject2;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Random;

public class ProblemGenerator{
    
    public ArrayList<int[][]> problems = new ArrayList<int[][]>();
    
    private int nofSymbols;
    private int nofClauses;
    private int negativeChance;
    private int nofProblems;
    public int[] variableAssignments;
    
    public ProblemGenerator(int nofSymbols, int nofClauses, int negativeChance, int nofProblems){
        
        this.nofSymbols = nofSymbols;
        this.nofClauses = nofClauses;
        this.negativeChance = negativeChance; //0 to 100
        this.nofProblems = nofProblems;
        variableAssignments = new int[nofSymbols];
        assignVariables(this.variableAssignments,nofSymbols);
        
    }
    
    public int getNofSymbols(){
        
        return this.nofSymbols;
        
    }
    
    public void assignVariables(int[] array, int nofSymbols){
        
        Random rand = new Random();
        
        for(int i=0;i<nofSymbols;i++){
            
            array[i] = rand.nextInt(2);
            
        }
        
    }
    
    public boolean checkIfContainsLiteral(int temp, int[] clause){
        
        boolean bool=false;
        
        for(int i=0;i<3;i++){
            if(temp==clause[i] || temp==-clause[i])
                bool = true;
        }
        
        return bool;
        
    }
    
    public boolean checkIfContainsClause(int[] clause, int[][] generatedProblem, int nofClausesGenerated){
        
        boolean bool=false;
        
        for(int i=0;i<nofClausesGenerated;i++){
            if(clause[0]==generatedProblem[i][0] && clause[2]==generatedProblem[i][2] && clause[2]==generatedProblem[i][2])
                bool = true;
        }
        
        return bool;
    }

    public int[] generateClause(){
        
        Random rand = new Random();
        
        int[] clause = new int[]{0,0,0};
        int temp;
        
        for(int i=0;i<3;i++){
            
            do{
                temp = rand.nextInt(this.nofSymbols) + 1;
            }while(checkIfContainsLiteral(temp,clause));
            
            clause[i] = temp;
            
        }
        
        Arrays.sort(clause);

        for(int i=0;i<3;i++){
            
            temp = rand.nextInt(100/this.negativeChance);
            if(temp==0) //Chance to turn negative
                    clause[i]=-clause[i];
            
        }
        
        return clause;
        
    }
    
    public void generateProblems(){
        
        int[][] generatedProblem = new int[this.nofClauses][3];
        
        for(int i=0;i<this.nofProblems;i++){ //Number of problems to be generated
            
            for(int j=0;j<this.nofClauses;j++){
                
                do{
                    generatedProblem[j]=generateClause();
                }while(checkIfContainsClause(generatedProblem[j],generatedProblem,j));
                
            }
            
            problems.add(generatedProblem);
            generatedProblem = new int[this.nofClauses][3];
            
        }
        
        this.printProblems();
        
    }
    
    public void printProblems(){
        
        for(int i=0;i<this.nofProblems;i++){
            
            System.out.println("-------Problem " + (i+1) + "-------");
            
            for(int row=0;row<this.nofClauses;row++){
                
                System.out.println(problems.get(i)[row][0] + " " + problems.get(i)[row][1] + " " + problems.get(i)[row][2]);
                
            }
            
            System.out.println();
            
        }
        
    }
    
}
