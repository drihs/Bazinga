function landmarks = create_landmarks(nest, visibility, number_landmark)

range_landmark = [nest(1) - 2*visibility, nest(1) + 2*visibility];

landmarks = zeros(number_landmark,2);

for i = 1:number_landmark
    x = randi(range_landmark);
    
    if (x == nest(1))
        x = x + 1;
    end
    
    lim = sqrt(4*visibility^2 - (x - nest(1))^2);
    y = randi([ceil(-lim)+nest(2),floor(lim)+nest(2)]);
    
    landmarks(i,:) = [x,y];
end

radius_land=landmark_matrix(landmarks,2*visibility,nest);
[k,l] = size(radius_land);

final_landmarks = [landmarks,zeros(number_landmark,2)];

for i = k:-1:1
    for j = 2:l
        if (radius_land(i,j) == 1)
            dt = 3*visibility;
            sol = [1000,1000];
            for m = 1:i-1
                for n = 1:l
                    if (n == 1 && radius_land(m,n) == 1 && norm(nest - landmarks(j-1,:)) <= dt)
                        dt = norm(nest - landmarks(j-1,:));
                        sol = nest;
                    elseif (radius_land(m,n) == 1 && norm(landmarks(n-1,:) - landmarks(j-1,:)) < dt) 
                        dt = norm(landmarks(n-1,:) - landmarks(j-1,:));
                        sol = landmarks(n-1,:);
                    end
                end
            end
            final_landmarks(j-1,3:4) = sol(1,:);
        end
    end
end

landmarks = final_landmarks;

end
