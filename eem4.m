clear all                   
m=0.02;                            %Set the mass
q=1.6e-2;                          %Set the quantity of charge
dt=0.0001;                          %Set the timestep to be 0.001s
t=0:dt:3;                        %Construct the array of time
vx=zeros(1,length(t));
vy=vx;vz=vx;                       %Construct the velocity vector
rx=zeros(1,length(t));
ry=vx;rz=vx;                       %Set the position vector

Ex=0; Ey=0; Ez=0;                   %Set the electric field vector
Bx=0; By=0; Bz=8;                   %Set the magnetic flux density vector
Fx=zeros(1,length(t));Fy=Fx;Fz=Fx;          %Construct the force vector
ax=zeros(1,length(t));ay=ax;az=ax;          %Construct the acceleration vector

for k= 0:15
vx(1) = 0.1*sin(k*pi/8);    
vy(1) = 0.1*cos(k*pi/8);
vz(1) = 10;                %Set the velocity vector’s initial value   
 
figure(1)
axis([-0.04,0.04,-0.04,0.04,0,30]);

for i=1:(length(t)-1)                        %Calculate each position point
 Fx(i)=q*Ex+q*(vy(i)*Bz-vz(i)*By);           %Calculate the acted force at position i
 Fy(i)=q*Ey+q*(vz(i)*Bx-vx(i)*Bz);           % Calculate the acted force at position i
 Fz(i)=q*Ez+q*(vx(i)*By-vy(i)*Bx);           % Calculate the acted force at position i
 ax(i)=Fx(i)/m;                              %Calculate the acceleration at position i
 ay(i)=Fy(i)/m;                              % Calculate the acceleration at position i
 az(i)=Fz(i)/m;                              % Calculate the acceleration at position i
 vx(i+1)=vx(i)+ax(i)*dt;                     %Calculate the velocity at position i+1
 vy(i+1)=vy(i)+ay(i)*dt;                     % Calculate the velocity at position i+1
 vz(i+1)=vz(i)+az(i)*dt;                     % Calculate the velocity at position i+1
 rx(i+1)=rx(i)+vx(i)*dt;                     %Calculate the position at point i+1
 ry(i+1)=ry(i)+vy(i)*dt;                     % Calculate the position at point i+1
 rz(i+1)=rz(i)+vz(i)*dt;                     % Calculate the position at point i+1
end
 plot3(rx,ry,rz);                            %Plotend
 hold on
end


grid
view(33,10)                                 %set the view
title('带电粒子在磁场中的运动轨迹11712419高君义');    % Set the graph’s title
xlabel('X轴');                      % Label x axis
ylabel('Y轴');                      % Label y axis
zlabel('Z轴');                      % Label z axis







