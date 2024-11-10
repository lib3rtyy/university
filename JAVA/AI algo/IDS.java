package com.mycompany.tnproject1;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.PriorityQueue;

public class IDS extends Edge implements Comparable<Node> {
    
    public boolean checkIfVisited(ArrayList<Node> visitedList){
        
        return visitedList.contains(this);
        
    }
    
    public int extendNode(ArrayList<Edge> edgeList, ArrayList<Node> visitedList, Node temp, PriorityQueue<Node> priorityQueue, ArrayList<Node> unwantedNodes, int nodeCounter, int iterativeDepth){
        
        for(int i=0;i<edgeList.size();i++){
            
            if(edgeList.get(i).getNode1()==temp && !visitedList.contains(edgeList.get(i).getNode2())){
                
                if(edgeList.get(i).Node2.parentNode==null || (edgeList.get(i).Node2.parentNode!=null && edgeList.get(i).Node2.pathCost>temp.pathCost + edgeList.get(i).weight)){
                    edgeList.get(i).Node2.parentNode = temp;
                    edgeList.get(i).Node2.pathCost = temp.pathCost + edgeList.get(i).weight;
                    edgeList.get(i).Node2.depth = 1 + temp.getDepth();
                    System.out.println("Extended node " + edgeList.get(i).getNode1().getRow() + "," + edgeList.get(i).getNode1().getColumn() + " with a depth of " + edgeList.get(i).getNode1().getDepth());
                    if(edgeList.get(i).getNode2().getDepth()<=iterativeDepth)
                        priorityQueue.add(edgeList.get(i).getNode2());
                    else{
                        unwantedNodes.add(edgeList.get(i).getNode2());
                        nodeCounter--;
                    }
                    
                }
                nodeCounter++;
            }
            else if(edgeList.get(i).getNode2()==temp && !visitedList.contains(edgeList.get(i).getNode1())){
                
                if(edgeList.get(i).Node1.parentNode==null || (edgeList.get(i).Node1.parentNode!=null && edgeList.get(i).Node1.pathCost>temp.pathCost + edgeList.get(i).weight)){
                    edgeList.get(i).Node1.parentNode = temp;
                    edgeList.get(i).Node1.pathCost = temp.pathCost + edgeList.get(i).weight;
                    edgeList.get(i).Node1.depth = 1 + temp.getDepth();
                    System.out.println("Extended node " + edgeList.get(i).getNode2().getRow() + "," + edgeList.get(i).getNode2().getColumn() + " with a depth of " + edgeList.get(i).getNode2().getDepth());
                    if(edgeList.get(i).getNode1().getDepth()<=iterativeDepth)
                        priorityQueue.add(edgeList.get(i).getNode1());
                    else{
                        unwantedNodes.add(edgeList.get(i).getNode1());
                        nodeCounter--;
                    }
                }
                nodeCounter++;
            }
            
        }

        return nodeCounter;
        
    }
    
    public void printSolution(Node goal, int nodeCounter){
        
        Node temp = new Node();
        
        System.out.println(nodeCounter + " nodes have been created");
        System.out.println("The total path cost to the goal is " + goal.pathCost + " with a depth of " + goal.getDepth());
        
        temp = goal;
        
        System.out.println("-----PATH-----");
        
        while(temp.getState()!=0){
            
            System.out.println(temp.getRow() + "," + temp.getColumn());
            temp = temp.getParentNode();
            
        }
        
        System.out.println(temp.getRow() + "," + temp.getColumn());
        
    }
    
    public void IDSalgo(Node[][] map, ArrayList<Edge> edgeList, int n){
        
        Comparator<Node> depthSorter = Comparator.comparing(Node::getDepth);
        PriorityQueue<Node> priorityQueue = new PriorityQueue<>(Collections.reverseOrder(depthSorter));
        ArrayList<Node> unwantedNodes = new ArrayList<Node>();
        
        int maxNodes = 999;
        int nodeCounter = 1;
        int iterativeDepth = 0;
        
        Node nodeOb = new Node();
        Node temp = new Node();
        IDS idsOb = new IDS();
        
        ArrayList<Node> visitedList = new ArrayList<Node>();
        boolean goalFound = false;
        boolean iteDepthReached = false;
        
        System.out.println("//----------IDS----------//");
        
        priorityQueue.add(nodeOb.getStart(map, n));
        unwantedNodes.add(nodeOb);
        
        while(!priorityQueue.isEmpty() && !unwantedNodes.isEmpty() && goalFound==false && nodeCounter<=maxNodes){
            
            iteDepthReached = false;
            priorityQueue.clear();
            unwantedNodes.clear();
            
            priorityQueue.add(nodeOb.getStart(map, n));
            nodeCounter = 1;
            
            while(!iteDepthReached && goalFound==false){
                
                temp = priorityQueue.remove();
            
                if(temp.getState()==1)
                    goalFound=true;
                else{
                    visitedList.add(temp);
                    nodeCounter = idsOb.extendNode(edgeList, visitedList, temp, priorityQueue, unwantedNodes, nodeCounter, iterativeDepth);
                }
                
                if(priorityQueue.isEmpty())
                    iteDepthReached = true;
                
            }
            
            iterativeDepth++;
          
        }
        
        if(goalFound==false)
            System.out.println("Problem can't be solved :(");
        else
            idsOb.printSolution(temp, nodeCounter);
        
    }

    @Override
    public int compareTo(Node o) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
