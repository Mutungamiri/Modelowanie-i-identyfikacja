function zad3(x, N, rozk, K, h, f, Title)
  figure
  plot(x, f)
  for k = 1 : size(K)
      f_est = zeros(1, N);
      for n = 1 : length(x)
        param = (rozk - x(n)) / h;
        f_est(n) = sum(K{k}(param)) / (N * h);
      end
      hold on;
      plot(x, f_est)
  end
  legend(...
      'Rozklad rzeczywisty', ...
      'Boxcar Kernel', ...
      'Gaussian Kernel', ...
      'Epanechnikov Kernel'...
      )
  title(Title)
  xlabel('x');
  ylabel('f_N(x)');
end