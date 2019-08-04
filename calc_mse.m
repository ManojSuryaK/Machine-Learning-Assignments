function error= calc_mse(y,t)
error=((y-t)'*(y-t))/length(t);
end
