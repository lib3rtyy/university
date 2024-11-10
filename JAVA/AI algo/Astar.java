package com.mycompany.tnproject1;

import java.util.ArrayList;
import java.util.PriorityQueue;
import java.util.Comparator;
import java.math.*;

public class Astar extends Edge implements Comparable<Node> {
    
    public boolean checkIfVisited(ArrayList<Node> visitedList){
        
        return visitedList.contains(this);
        
    }
    
    public void manhattanCost(Node[][] map, int n){
        
        Node nodeObject = new Node();
        
        for(int i=0;i<n;i++){
            for(int j=0;j<n;j++){
                
                map[i][j].manhattanCost = Math.abs(map[i][j].getRow()-nodeObject.getStart(map, n).getRow()) + Math.abs(map[i][j].getColumn()-nodeObject.getStart(map, n).getColumn());
                //System.out.println("(" + map[i][j].getRow() + " - " + nodeObject.getStart(map, n).getRow() + ") + (" + map[i][j].getColumn() + " - " + nodeObject.getStart(map, n).getColumn() + ") = " + map[i][j].manhattanCost);
                
            }
        }
        
    }
    
    public int extendNode(ArrayList<Edge> edgeList, ArrayList<Node> visitedList, Node temp, PriorityQueue<Node> priorityQueue, int nodeCounter){
        
        for(int i=0;i<edgeList.size();i++){
            
            if(edgeList.get(i).getNode1()==temp && !visitedList.contains(edgeList.get(i).getNode2())){
                
                if(edgeList.get(i).Node2.parentNode==null || (edgeList.get(i).Node2.parentNode!=null && edgeList.get(i).Node2.totalCost>temp.pathCost + edgeList.get(i).weight + edgeList.get(i).Node2.manhattanCost)){
                    edgeList.get(i).Node2.parentNode = temp;
                    edgeList.get(i).Node2.pathCost = temp.pathCost + edgeList.get(i).weight;
                    edgeList.get(i).Node2.totalCost = edgeList.get(i).Node2.pathCost + edgeList.get(i).Node2.manhattanCost;
                    edgeList.get(i).Node2.depth = temp.depth + 1;
                    //System.out.println("Extended node " + edgeList.get(i).getNode1().getRow() + "," + edgeList.get(i).getNode1().getColumn());
                    priorityQueue.add(edgeList.get(i).getNode2());
                }
                nodeCounter++;
            }
            else if(edgeList.get(i).getNode2()==temp && !visitedList.contains(edgeList.get(i).getNode1())){
                
                if(edgeList.get(i).Node1.parentNode==null || (edgeList.get(i).Node1.parentNode!=null && edgeList.get(i).Node1.totalCost>temp.pathCost + edgeList.get(i).weight + edgeList.get(i).Node1.manhattanCost)){
                    edgeList.get(i).Node1.parentNode = temp;
                    edgeList.get(i).Node1.pathCost = temp.pathCost + edgeList.get(i).weight;
                    edgeList.get(i).Node1.totalCost = edgeList.get(i).Node1.pathCost + edgeList.get(i).Node1.manhattanCost;
                    edgeList.get(i).Node1.depth = temp.depth + 1;
                    //System.out.println("Extended node " + edgeList.get(i).getNode2().getRow() + "," + edgeList.get(i).getNode2().getColumn());
                    priorityQueue.add(edgeList.get(i).getNode1());
                }
                nodeCounter++;
            }
            
        }

        return nodeCounter;
        
    }
    
    public void printSolution(Node goal, int nodeCounter){
        
        Node temp = new Node();
        
        System.out.println(nodeCounter + " nodes have been created");
        System.out.println("The total path cost to the goal is " + goal.totalCost);
        
        temp = goal;
        
        System.out.println("-----PATH-----");
        
        while(temp.getState()!=0){
            
            System.out.println(temp.getRow() + "," + temp.getColumn());
            temp = temp.getParentNode();
            
        }
        
        System.out.println(temp.getRow() + "," + temp.getColumn());
        
    }
    
    public void AstarAlgo(Node[][] map, ArrayList<Edge> edgeList, int n){
        
        Comparator<Node> costSorter = Comparator.comparing(Node::getTotalCost);
        PriorityQueue<Node> priorityQueue = new PriorityQueue<>(costSorter);
        
        int maxNodes = 999;
        int nodeCounter = 1;
        
        Node nodeOb = new Node();
        Node temp = new Node();
        Astar AstarOb = new Astar();
        
        ArrayList<Node> visitedList = new ArrayList<Node>();
        boolean goalFound = false;
        
        System.out.println("//----------A*----------//");
        
        AstarOb.manhattanCost(map, n);
        priorityQueue.add(nodeOb.getStart(map, n));
        
        while(!priorityQueue.isEmpty() && goalFound==false && nodeCounter<=maxNodes){
            
            temp = priorityQueue.remove();
            
            if(temp.getState()==1)
                goalFound=true;
            else{
                visitedList.add(temp);
                nodeCounter = AstarOb.extendNode(edgeList, visitedList, temp, priorityQueue, nodeCounter);
            }
            
            if(priorityQueue.isEmpty())
                System.out.println("Priority queue is empty");
          
        }
        
        if(goalFound==false)
            System.out.println("Problem can't be solved :(");
        else
            AstarOb.printSolution(temp, nodeCounter);
        
    }
    
    @Override
    public int compareTo(Node o) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
