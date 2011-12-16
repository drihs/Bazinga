function nest = create_nest(size,visibility)

range_nest = [-size + 1 + 2*visibility, size - 1 - 2*visibility];
nest = [randi(range_nest),randi(range_nest)];

end
