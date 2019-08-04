function plotData(X, y)

figure; hold on;

pos = find(y==1); neg = find(y == 0);

plot(X(pos, 1), X(pos, 2), 'k+','MarkerSize', 5);
plot(X(neg, 1), X(neg, 2), 'ko', 'MarkerSize', 5);

hold off;

end
