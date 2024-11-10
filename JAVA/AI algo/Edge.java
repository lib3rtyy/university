package com.mycompany.tnproject1;

import java.util.ArrayList;
import java.util.Random;

public class Edge extends Node {
    
    protected int weight;
    protected Node Node1;
    protected Node Node2;
    
    public Edge(){
        
        weight=0;
        Node1=null;
        Node2=null;        
        
    }
    
    public Edge(int weight,Node parent,Node child){
        
        this.weight=weight;
        this.Node1=parent;
        this.Node2=child;        
        
    }
    
    public int getWeight(){
        return this.weight;
    }
    
    public Node getNode1(){
        return this.Node1;
    }
    
    public Node getNode2(){
        return this.Node2;
    }
    
    public void createEdges(ArrayList<Edge> edgeList, Node[][] map, int n){
        
        Node temp1,temp2;
        int tempW;
        Edge tempEdge;
        Random rand = new Random();
        
        
        for(int i=0;i<n;i++){
            for(int j=0;j<n;j++){
                
                //horizontal edge
                if(j<n-1){
                    tempW = rand.nextInt(20) + 1;

                    temp1 = map[i][j];
                    temp2 = map[i][j+1];

                    tempEdge = new Edge(tempW,temp1,temp2);

                    edgeList.add(tempEdge);
                }
                
                //vertical edge
                if(i<n-1){
                    tempW = rand.nextInt(20) + 1;

                    temp1 = map[i][j];
                    temp2 = map[i+1][j];

                    tempEdge = new Edge(tempW,temp1,temp2);

                    edgeList.add(tempEdge);
                }
                
            }
        }
        
        System.out.print("\n\n");
        
    }
    
    public void printEdgeWeights(ArrayList<Edge> edgeList){
        
        System.out.print("Edge weights\n---------------------\n");
        
        for(int i=0;i<edgeList.size();i++){
                
                System.out.println("Connecting " + edgeList.get(i).Node1.getRow() + "," + edgeList.get(i).Node1.getColumn() + " and " + edgeList.get(i).Node2.getRow() + "," + edgeList.get(i).Node2.getColumn() + " with a weight of " + edgeList.get(i).weight);
                
        }
        
        System.out.print("---------------------\n\n");
        
    }
    
    public void deletePercofEdges(ArrayList<Edge> edgeList, int n, float p){
        
        int startSize = edgeList.size();
        float numtoBeRemoved = startSize*(p/100);
        
        Random rand = new Random();
        int randIndex;
        
        System.out.print("\nRemoved " + p + "% of edges\n---------------------\n");
        
        /*
        for(int i=0;i<(int)numtoBeRemoved;i++){
            
            randIndex = rand.nextInt(edgeList.size());
            System.out.println("Removed " + randIndex + " = " + edgeList.get(randIndex).weight);
            edgeList.remove(randIndex);
            
        }*/
        
        System.out.print("---------------------\n\n");
        
    }
    
    public void resetParentstoNull(ArrayList<Edge> edgeList){
        
        for(int i=0;i<edgeList.size();i++){
            
            edgeList.get(i).Node1.parentNode = null;
            edgeList.get(i).Node2.parentNode = null;
            
        }
        
    }
    
}
