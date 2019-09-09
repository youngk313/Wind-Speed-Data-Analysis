function X = autoRegProcess(N,a)
%Returns N values for an autoregressive process with a. Initial value X0 -
%normally distributed with zero mean and variance = 1/(1-a^2)

    X = zeros(N, 1);
    X(1) = normrnd(0, 1/(1 - a^2));

    for i=2:N
        X(i) = a*X(i - 1) + normrnd(0, 1);
    end
end

