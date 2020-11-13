clc
clear all
close all

%This code is for single variable optimization only
%%
%Initializing necessary parameters
N = 50; %Number of particles
chi = 0.2; %Acceleration factor
d = 1; %Number of dimensions
phi = 20; 

x = rand(N,d); %Positions
v = rand(N,d); %Velocity
pbest = x; %Personal best positions

%fitness function
f = @(x) 2+sum((x-3).^2);


%%
%Updating values of v and x
iter = 1;
max_iter = 10;
best_val = [];

while(iter<=max_iter)
diffvect = zeros(1, d);
best = zeros(1, N);
for i=1:N
    diffvect = sum(pbest - repmat(x(i,:), N,1),1) .* rand(1, d) * phi/N;
    v(i, :) = chi*(v(i, :) + diffvect);
    x(i, :) = v(i, :);
    new_fitness_val = f(x(i, :));
    if new_fitness_val<f(pbest(i, : ));
        pbest(i, : ) = x(i, : );
        best(1, i) = new_fitness_val;
    else
        best(1, i) = f(pbest(i, :));
    end
end

best_val = [best_val min(best)];
iter = iter + 1;

end

plot(1:max_iter, best_val)


best_val(end)

