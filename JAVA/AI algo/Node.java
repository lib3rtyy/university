package com.mycompany.tnproject1;

import static java.lang.Integer.MAX_VALUE;
import java.util.Random;

public class Node {
    
    private int state; //0 is Start, 1 is Goal, 2 is normal node
    protected Node parentNode;
    protected int pathCost;
    protected int manhattanCost;
    protected int totalCost;
    protected int depth; 
    private int row;
    private int column;
    
    public Node(){
        
        state=2;
        parentNode=null;
        pathCost=MAX_VALUE;
        manhattanCost=0;
        depth=MAX_VALUE;
        
        
    }
    
    public Node(int state,Node parentNode,int pathCost,int depth, int manhattanCost){
        
        this.state=state;
        this.parentNode=parentNode;
        this.pathCost=pathCost;
        this.manhattanCost=manhattanCost;
        this.depth=depth;
        
        
    }
    
    public int getState(){
        return this.state;
    }
    
    public Node getParentNode(){
        return this.parentNode;
    }
    
    public int getPathCost(){
        return this.pathCost;
    }
    
    public int getTotalCost(){
        return this.totalCost;
    }
    
    public int getDepth(){
        return this.depth;
    }
    
    public int getRow(){
        return this.row;
    }
    
    public int getColumn(){
        return this.column;
    }
    
    public void initializeMap(Node[][] map, int n){
        
        for(int i=0;i<n;i++){
            for(int j=0;j<n;j++){
                
                map[i][j] = new Node();
                map[i][j].row = i;
                map[i][j].column = j;
                
            }
        }
        
    }
    
    public void printMap(Node[][] map, int n){
        
        System.out.print("Map\n---------------------\n");
        
        for(int i=0;i<n;i++){
            for(int j=0;j<n;j++){
                
                System.out.print(map[i][j].state + " ");
                
            }
            System.out.print("\n");
        }
        
        System.out.print("---------------------\n");
        System.out.print("\n");
        
    }
    
    public void setStartEnd(Node[][] map, int n){
        
        Random rand = new Random();
        int i,j;
        
        //Start
        i = rand.nextInt(n);
        j = rand.nextInt(n);

        map[i][j].state = 0;
        map[i][j].pathCost = 0;
        map[i][j].depth = 0;
        
        //End
        while(map[i][j].state == 0){
            i = rand.nextInt(n);
            j = rand.nextInt(n);
        }
        map[i][j].state = 1;
          
    }
    
    public Node getStart(Node[][] map, int n){
        
        Node temp = new Node();
        
        for(int i=0;i<n;i++){
            for(int j=0;j<n;j++){
           
                if(map[i][j].state==0)
                    temp=map[i][j];
                
            }
        }

        return temp;
        
    }
    
    public Node getGoal(Node[][] map, int n){
        
        Node temp = new Node();
        
        for(int i=0;i<n;i++){
            for(int j=0;j<n;j++){
           
                if(map[i][j].state==1)
                    temp=map[i][j];
                
            }
        }

        return temp;
        
    }
    
}
