clc
clear all
close all

%This code is for single variable optimization only
%%
%Initializing necessary parameters
N = 50; %Number of particles
w = 0.9*ones(N,1);  %Inertial weight
c1 = 3; %Cognitive coefficient
c2 = 0.05; %Social coefficient

x = rand(N,1); %Positions
v = rand(N,1); %Velocity
pbest = zeros(N,1); %Personal best positions
lbest = zeros(N,1); %Local best position

%fitness function
f = @(x) 2+(x-3).^2;
prev_fitness_val = f(x);

%%
%Updating values of v and x
iter = 1;
max_iter = 1000;
best_val = [];

while(iter<=max_iter)

v = w.*v + c1*rand(N,1).*(pbest-x) + c2*rand(N,1).*(lbest-x);
x = x + v;

new_fitness_val = f(x);
compare = find(new_fitness_val<prev_fitness_val);
pbest(compare) = x(compare);
[min_val, ind] = min(new_fitness_val);
best_val = [best_val min_val];

if length(ind)>1
    ind = ind(1);
    lbest = x(ind)*ones(N,1);
end
prev_fitness_val = new_fitness_val;

iter = iter + 1;

end

plot(1:max_iter, best_val)


best_val(end)

