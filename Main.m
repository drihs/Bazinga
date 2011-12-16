it = 10000;

number_landmarks = 10;

number_foods = 10;

size = 40;

visibility = 10;

nest = create_nest(size,visibility);

foods = create_foods(size,number_foods,nest,visibility);

landmarks = create_landmarks(nest,visibility,number_landmarks);

global_vector = [0,0];

alpha = pi/2;

dens = 0.5;

errFood = 0.5;
errNest = 0.2;

pos = [nest(1),nest(2)];

length_to_food = 0;
length_to_nest = 0;

figure

h = subplot(2,1,1);
plot(nest(1),nest(2),'dc',landmarks(:,1),landmarks(:,2),'ok','Markersize',8)
for i = 1:number_landmarks
   hold on;
   quiver(landmarks(i,1),landmarks(i,2),landmarks(i,3)-landmarks(i,1),landmarks(i,4)-landmarks(i,2));
end
axis(h,[-size,size,-size,size]);

t = 2;
while (t < it)
    j = subplot(2,1,2);
    [X,Y,alpha,l] = search_food(pos(t-1,:),alpha,dens,visibility,errFood,size,foods);
    pos(t,:) = [X,Y];
    length_to_food = length_to_food + l;
    [vx,vy] = update_glob_vect(global_vector(1,:),pos(t,:)-pos(t-1,:));
    global_vector(1,:) = [vx,vy];   
    plot(pos(t,1),pos(t,2),'or',pos(1:t,1),pos(1:t,2),'-',nest(1),nest(2),'dc',landmarks(:,1),landmarks(:,2),'ok',foods(:,1),foods(:,2),'xg','MarkerSize',8);
    hold on;
    quiver(pos(t,1),pos(t,2),-global_vector(1),-global_vector(2));
    axis(j,[-size,size,-size,size]);
    if (check_position(pos(t,:),foods) == 1)
    	break;
    end
    pause(0.00001);
    cla
    t = t + 1;
end  

land = landmarks;

check = 0;
last_landmark = [size+1,size+1];

Q = length(pos);
t = Q + 1;

while (t < 2*it)
    [X,Y,check,last_landmark,l] = search_nest(visibility,dens,-global_vector(1,:),nest(1,:),pos(t-1,:),errNest,check,landmarks,last_landmark(1,:));
    length_to_nest = length_to_nest + l;
    pos(t,:) = [X,Y];
    [vx,vy] = update_glob_vect(global_vector(1,:),pos(t,:)-pos(t-1,:));
    global_vector(1,:) = [vx,vy];
    plot(pos(t,1),pos(t,2),'or',pos(1:t,1),pos(1:t,2),'-r',nest(1),nest(2),'dc',land(:,1),land(:,2),'ok',foods(:,1),foods(:,2),'xg',pos(1:Q,1),pos(1:Q,2),'-','MarkerSize',8)
    hold on;
    quiver(pos(t,1),pos(t,2),-global_vector(1),-global_vector(2));
    axis([-size,size,-size,size]);
    if (check_position(pos(t,:), nest))
        break;
    end
    pause(0.01);
    cla
    t = t + 1;
end  

length_to_food
length_to_nest
Rapp = length_to_food/length_to_nest

