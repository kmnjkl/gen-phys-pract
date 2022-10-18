using Statistics


"""

    lin_ls(x, y, Sy)
    
    Linear least squares fit of ``y = a*x + b``.
    As described in "Анализ и обработка экспериментальных данных" И.В.Митин, В.С.Русаков, 2017.
"""
function lin_ls(x, y, Sy)
    # Linear least squares
    # x: independent variable
    # y: dependent variable
    # Sy: standard deviation of y
    # returns: a, b, Sa, Sb, r
    # a: intercept
    # b: slope
    # Sa: standard deviation of a
    # Sb: standard deviation of b
    # r: correlation coefficient

    delta = sum((x ./ Sy) .^ 2) * sum((1 ./ Sy) .^ 2) - (sum(x ./ (Sy .^ 2))) ^ 2;
    delta_a = sum(x .* y ./ (Sy .^ 2)) * sum((1 ./ Sy) .^ 2) - sum(x ./ (Sy .^ 2)) * sum(y ./ (Sy .^ 2));
    delta_b = sum((x ./ Sy) .^ 2) * sum(y ./ (Sy .^ 2)) - sum(x ./ (Sy .^ 2)) * sum(x .* y ./ (Sy .^ 2));

    a = delta_a ./ delta;
    b = delta_b ./ delta;

    Sa = sqrt(sum((1 ./ Sy) .^ 2) ./ delta);
    Sb = sqrt(sum((x ./ Sy) .^ 2) ./ delta);

    r = sum((x .- mean(x)) .* (y .- mean(y))) ./ sqrt(sum((x .- mean(x)) .^ 2) * sum((y .- mean(y)) .^ 2));

    return Dict("x" => x, "y" => y, "y_err" => Sy, "a" => a, "b" => b, "a_err" => Sa, "b_err" => Sb, "r" => r)
end


"""
    const_ls(y, y_err)

    Calculate the least squares fit for a constant function `y = b`.
    Returns Dict with keys "y", "y_err", "b", "b_err", "r".
    As described in "Анализ и обработка экспериментальных данных" И.В.Митин, В.С.Русаков, 2017.
"""
function const_ls(y, y_err)
    b = sum(y ./ y_err.^2) / sum(1 ./ y_err.^2)
    b_err = sqrt(1 / sum(1 ./ y_err.^2))
    return Dict("y" => y, "y_err" => y_err, "b" => b, "b_err" => b_err)
end