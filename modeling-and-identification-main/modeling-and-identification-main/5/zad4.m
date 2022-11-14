function zad4(M, L, N, h_N, K, x)
  error = zeros(size(h_N));
  for i = 1 : length(h_N)
      h = h_N(i);
      for l = 1 : L
          r = gen_rozk_norm(N);
          f = f_norm(x);
          f_est = zeros(1, N);
          for j = 1 : length(x)
            f_est(j) = sum(K((r - x(j)) / h)) / (N * h);
          end
          error(i) = error(i) + sumsqr(f_est - f);
      end
      error(i) = error(i) / (L * M);
  end
  figure
  plot(h_N, error);
  xlabel('h_N')
  ylabel('$Err\{ \hat{f_N} \}$', 'Interpreter', 'Latex')
end
