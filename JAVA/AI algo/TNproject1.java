package com.mycompany.tnproject1;

import java.util.Scanner;
import java.util.ArrayList;

public class TNproject1 {

    public static void main(String[] args) {
              
        //n is map dimension, p is % of vertices to be removed
        int n;
        float p;
        Scanner input=new Scanner(System.in);
        Node nodeObj = new Node();
        Edge edgeObj = new Edge();
        UCS ucsObj = new UCS();
        Astar AstarObj = new Astar();
        IDS idsObj = new IDS();
        
        System.out.println("Type a number for the map's dimensions (nxn)");
        n = input.nextInt();
        System.out.print("\n");
        
        Node[][] map = new Node[n][n];
        nodeObj.initializeMap(map, n);
        
        ArrayList<Edge> edgeList = new ArrayList<Edge>();
        edgeObj.createEdges(edgeList, map, n);
        edgeObj.printEdgeWeights(edgeList);
        
        System.out.println("Type a number for the percentage of vertices to be removed");
        p = input.nextInt();
        System.out.print("\n");
        
        edgeObj.deletePercofEdges(edgeList, n, p);
        edgeObj.printEdgeWeights(edgeList);
        
        nodeObj.setStartEnd(map, n);
        nodeObj.printMap(map, n);
        
        ucsObj.UCSalgo(map, edgeList, n);
        
        AstarObj.resetParentstoNull(edgeList);
        AstarObj.AstarAlgo(map, edgeList, n);
        
        idsObj.resetParentstoNull(edgeList);
        idsObj.IDSalgo(map, edgeList, n);
        
    }
}
