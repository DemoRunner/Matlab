% Exercise 3: Multivariate Linear Regression
% ��������Իع�
%
% �������ݲ���Ԥ����
x = load('data\ex3x.dat');
y = load('data\ex3y.dat');
m = length(x);
x = [ones(m, 1), x];  %��һ��ȫΪ1������ƫ����
x_unscaled = x; %����Ϊ��һ����x�����淽�̽�Ҫ�õ�
sigma = std(x);  % ���Ϊvector���򷵻ر�׼�����Ǿ��󣬷���ÿһ�м�ÿ��ά�ı�׼��
mu = mean(x);  % ���Ϊvector������ƽ��ֵ�����Ϊ���󣬷���ÿһ�е�ƽ��ֵ
x(:,2) = (x(:,2) - mu(2))./ sigma(2);  % ��һ������ȥƽ��ֵ�ٳ���׼��,x(:2)��ʾ�ڶ���
x(:,3) = (x(:,3) - mu(3))./ sigma(3);
%
% Ϊ��ͼ��׼��
figure;
plotstyle = {'b', 'r', 'g', 'k', 'b--', 'r--'}; %��ͬ��ѧϰ���ò�ͬ�Ļ��߷��
%
% �ݶ��½�
MAX_ITR = 100;
alpha = [0.01, 0.03, 0.1, 0.3, 1, 1.3];%ѧϰ��
theta_grad_descent = zeros(size(x(1,:)));
n = length(alpha);%���鲻ͬ��ѧϰ��
for i = 1:n
    theta = zeros(size(x(1,:)))'; % size(x(1,:))����1*n������nΪÿ��������ά����ת�ú�Ϊn*1��0����
    J = zeros(100, 1);
    for num_iterations = 1:MAX_ITR
        J(num_iterations) = (0.5/m).* sum((y-x*theta).^2);  % ��ʧ����,
        theta = theta - alpha(i)*(1/m).*x'*(x*theta-y);% .* �Ǿ����ж�Ӧλ�ñ�����ˣ�����µþ���
    end
    plot(0:49, J(1:50), char(plotstyle(i)), 'LineWidth', 2);%������ʧ������ͼ��
    hold on;
    
    %ͨ��ʵ�鷢��alphaΪ1ʱ��ʧ��С�������¼����ʱ��theta
    if alpha(i) == 1
        theta_grad_descent = theta;
    end
end
legend('0.01', '0.03', '0.1', '0.3', '1', '1.3');
xlabel('Number of iterations');
ylabel('Cost L');

% Ԥ��
theta_grad_descent;

% Ԥ�ⷿ�����Ϊ1650��������Ϊ3�ķ���
price_grad_desc = dot(theta_grad_descent, [1, (1650-mu(2))/sigma(2), (3-mu(3))/sigma(3)])

% Normal equations
theta = inv(x_unscaled'*x_unscaled)*x_unscaled'*y

price_normal = dot(theta, [1, 1650, 3])