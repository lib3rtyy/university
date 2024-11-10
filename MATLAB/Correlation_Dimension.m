dim = 2;
lag = 1;
Np = 10;

%Old-1
load O1.txt
x1=O1(:); 
correlationDimension(x1,'Dimension',dim,'Lag',lag,'NumPoints',Np);
MinR_O1 = 0.00097;
MaxR_O1= 0.00956;
corr_dim_O1 = correlationDimension(x1,'Dimension',dim,'MinRadius',MinR_O1,'MaxRadius',MaxR_O1,'NumPoints',Np);

%Old-2
load O2.txt
x2=O2(:); 
correlationDimension(x2,'Dimension',dim,'Lag',lag,'NumPoints',Np);
MinR_O2 = 0.00150;
MaxR_O2= 0.00679;
corr_dim_O2 = correlationDimension(x2,'Dimension',dim,'MinRadius',MinR_O2,'MaxRadius',MaxR_O2,'NumPoints',Np);

%Old-3
load O3.txt
x3=O3(:);
correlationDimension(x3,'Dimension',dim,'Lag',lag,'NumPoints',Np);
MinR_O3 = 0.00097;
MaxR_O3= 0.00958;
corr_dim_O3 = correlationDimension(x3,'Dimension',dim,'MinRadius',MinR_O3,'MaxRadius',MaxR_O3,'NumPoints',Np);

%Old-4
load O4.txt
x4=O4(:); 
correlationDimension(x4,'Dimension',dim,'Lag',lag,'NumPoints',Np);
MinR_O4 = 0.00174;
MaxR_O4= 0.01729;
corr_dim_O4 = correlationDimension(x4,'Dimension',dim,'MinRadius',MinR_O4,'MaxRadius',MaxR_O4,'NumPoints',Np);

%Old-5
load O5.txt
x5=O5(:); 
correlationDimension(x5,'Dimension',dim,'Lag',lag,'NumPoints',Np);
MinR_O5 = 0.00088;
MaxR_O5= 0.00860;
corr_dim_O5 = correlationDimension(x5,'Dimension',dim,'MinRadius',MinR_O5,'MaxRadius',MaxR_O5,'NumPoints',Np);

%Young-1
load Y1.txt
y1=Y1(:); 
correlationDimension(y1,'Dimension',dim,'Lag',lag,'NumPoints',Np);
MinR_Y1 = 0.00092;
MaxR_Y1= 0.01852;
corr_dim_Y1 = correlationDimension(y1,'Dimension',dim,'MinRadius',MinR_Y1,'MaxRadius',MaxR_Y1,'NumPoints',Np);

%Young-2
load Y2.txt
y2=Y2(:); 
correlationDimension(y2,'Dimension',dim,'Lag',lag,'NumPoints',Np);
MinR_Y2 = 0.00095;
MaxR_Y2= 0.02021;
corr_dim_Y2 = correlationDimension(y2,'Dimension',dim,'MinRadius',MinR_Y2,'MaxRadius',MaxR_Y2,'NumPoints',Np);

%Young-3
load Y3.txt
y3=Y3(:); 
correlationDimension(y3,'Dimension',dim,'Lag',lag,'NumPoints',Np);
MinR_Y3 = 0.00133;
MaxR_Y3= 0.01310;
corr_dim_Y3 = correlationDimension(y3,'Dimension',dim,'MinRadius',MinR_Y3,'MaxRadius',MaxR_Y3,'NumPoints',Np);

%Young-4
load Y4.txt
y4=Y4(:); 
correlationDimension(y4,'Dimension',dim,'Lag',lag,'NumPoints',Np);
MinR_Y4 = 0.00120;
MaxR_Y4= 0.02456;
corr_dim_Y4 = correlationDimension(y4,'Dimension',dim,'MinRadius',MinR_Y4,'MaxRadius',MaxR_Y4,'NumPoints',Np);

%Young-5
load Y5.txt
y5=Y5(:); 
correlationDimension(y5,'Dimension',dim,'Lag',lag,'NumPoints',Np);
MinR_Y5 = 0.00100;
MaxR_Y5= 0.02036;
corr_dim_Y5 = correlationDimension(y5,'Dimension',dim,'MinRadius',MinR_Y5,'MaxRadius',MaxR_Y5,'NumPoints',Np);

