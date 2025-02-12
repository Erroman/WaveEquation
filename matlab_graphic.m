L=1;  % string length 
c=1;   % wave velocity
f=5;  % frequency of the input wave

time=4;   % total simulation time
dx=0.005;  % step in position
dt=0.005;  % time step

nx=ceil(L/dx)+1;  % total number of columns
nt=ceil(time/dt)+1;  % total number of rows
u=zeros(nt,nx);   % initializing matrix u with zeros 

r=(c*dt/dx)^2;
for i=2:nt
    u(i,1)=3*sin(2*pi*f*i*dt)*exp(-i*dt);
end    
for j=2:nx-1  %loop for every column
  u(2,j) =u(1,j)+1/2*r*(u(1,j+1) - 2*u(1,j)+ u(1,j-1)); % solution for the first time step 
end 
for i = 3:nt % complete this part. For loop for  time (rows)
    for j= 2:nx-1 % complete this part. For loop for space (columns)
     % use eq. 9 to complete this part
     u(i,j)=2*u(i-1,j)-u(i-2,j)+r*(u(i-1,j+1)-2*u(i-1,j)+u(i-1,j-1));
    end
end
%function plotSimulation(u)

close all;
[nt,nx]=size(u);
figure
hold on;
for i = 3 : nt
    plot(u(i,:));
    axis([0 nx -5 5]);
    pause(0.008);
    hold off;
end

%end
