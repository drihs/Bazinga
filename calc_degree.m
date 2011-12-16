function alpha = calc_degree(vector)

alpha = asin(vector(2)/norm(vector));

if (vector(1) <= 0 && vector(2) >= 0)
	alpha = pi - alpha;
elseif (vector(2) <= 0 && vector(1) >= 0)
	alpha = 2*pi + alpha;
elseif (vector(2) <= 0 && vector(1) <= 0)
	alpha = pi - alpha;
end

end
