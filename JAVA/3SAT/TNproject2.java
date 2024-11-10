package com.mycompany.tnproject2;

import java.util.Scanner;


public class TNproject2 {

    public static void main(String[] args) {
       
        Scanner input=new Scanner(System.in);
        
        int nofSymbols, nofClauses, negativeChance, nofProblems, maxTries, maxFlips, probability;
        
        System.out.println("-----Generator attributes-----");
        System.out.print("Number of symbols:");
        nofSymbols = input.nextInt();
        
        System.out.print("Number of clauses for each problem:");
        nofClauses = input.nextInt();
        
        System.out.print("Probability to turn a literal negative(0 to 100):");
        negativeChance = input.nextInt();
        
        System.out.print("Number of problems to be generated:");
        nofProblems = input.nextInt();
        
        ProblemGenerator generator = new ProblemGenerator(nofSymbols,nofClauses,negativeChance,nofProblems);
        
        generator.generateProblems();
        
        System.out.println("-----Algorithm attributes-----");
        System.out.print("Maximum number of tries:");
        maxTries = input.nextInt();
        
        System.out.print("Maximum number of flips per try:");
        maxFlips = input.nextInt();
        
        System.out.print("Random walk probability:");
        probability = input.nextInt();
     
        GSAT gsatObj;
        GSAT_RW gsat_rwObj;
        WalkSAT walksatObj;
        
        System.out.println("//-----GSAT-----//");
        
        for(int i=0;i<nofProblems;i++){
            System.out.println("-----Solving problem " + (i+1) + " -----");
            gsatObj = new GSAT(maxFlips,maxTries,generator.problems.get(i));
            gsatObj.GSATalgo(nofSymbols, nofClauses,generator.variableAssignments);
        }     
        
        System.out.println("//-----GSAT with random walk-----//");
        
        for(int i=0;i<nofProblems;i++){
            System.out.println("-----Solving problem " + (i+1) + " -----");
            gsat_rwObj = new GSAT_RW(maxFlips,maxTries,generator.problems.get(i),probability);
            gsat_rwObj.GSAT_RWalgo(nofSymbols, nofClauses,generator.variableAssignments);
        } 
        
        System.out.println("//-----WalkSAT-----//");
        
        for(int i=0;i<nofProblems;i++){
            System.out.println("-----Solving problem " + (i+1) + " -----");
            walksatObj = new WalkSAT(maxFlips,maxTries,generator.problems.get(i),probability);
            walksatObj.WalkSATalgo(nofSymbols, nofClauses,generator.variableAssignments);
        } 
        
    }
}
