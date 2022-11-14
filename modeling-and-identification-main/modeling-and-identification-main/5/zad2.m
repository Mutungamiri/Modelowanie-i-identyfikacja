function zad2(N, rozk, K)
  h = [0.25 1 1.5 2.25];
  x = linspace(-3, 5, N);
  figure
  legendArray = cell(length(h) + 1, 1);
  for i = 1:length(h)
      f_est = zeros(1, N);
      for j = 1 : length(x)
        f_est(j) = sum(K((rozk - x(j)) / h(i))) / (N * h(i));
      end
      hold on;
      plot(x, f_est);
      legendArray{i} = strcat('h_{N}=', num2str(h(i)));
  end
  plot(x, f_norm(x-1));
  legendArray{length(h) + 1} = 'Rozklad Normalny';
  legend(legendArray);
  xlabel('x');
  ylabel('f_N(x)');
end