function U=wave(f,g,a,b,c,n,m)
% Input  -- f=u(x,0) as a string 'f'
%        -- g=ut(x,0) as a string 'g' 
%        -- a and b right end points of [0,a] and [0,b]
%        -- c=the speed constant in wave equation
%        -- n and m number of grid points over [0,a] and [0,b] 
% Output -- U solution matrix; 
% Initialize parameters and U
h=a/(n-1);
k=b/(m-1);
r=c*k/h;
r2=r^2; 
r22=r^2/2;
s1=1-r^2;
s2=2-2*r^2;
U=zeros(n,m);

% Compute first and second rows
for i=2:n-1
    U(i,1)=feval(f,h*(i-1));
    U(i,2)=s1*feval(f,h*(i-1))+k*feval(g,h*(i-1))+r22*(feval(f,h*i) + feval(f,h*(i-2)));
end

% Compute remaining rows of U 
for j=3:m
    for i=2:(n-1)
        U(i,j) = s2*U(i,j-1)+r2*(U(i-1,j-1)+U(i+1,j-1))-u(i,j-2);
    end
end 

U=U'; 