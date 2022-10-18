function mnk (x, y, plot_num_points=500)
  p = polyfit(x, y, 1);

  t = min(x):(max(x)-min(x))/plot_num_points:max(x)
  plot(t, p(1) * t + p(2))

endfunction
