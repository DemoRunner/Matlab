% Exercise 4: Logistic Regression and Newton's Method
% �߼�˹�ٻع��ţ�ٷ���
% �����ǲ���logistic regressionģ�ͺ�newton�㷨�����ݽ��ж�����ࣨ0��1����
% ������40������ѧ���յ�ѧ����40�����ܾ���ѧ�������ųɼ�
% ����ѧ������ģ��Ȼ�����һ��ѧ�������ųɼ���Ԥ�ⱻ��ѧ���յĸ���


% ��ʼ������
x = load('data\ex4x.dat');
y = load('data\ex4y.dat');
m = length(x);   %mѵ��������
x = [ones(m,1), x];  %����ƫ����1����һ��
n = size(x, 2);  % nΪ��������������3

% find�ҳ������������к�����
pos = find(y == 1); 
neg = find(y == 0);
% ��ͼ��ʾ

plot(x(pos, 2), x(pos, 3), '+'); hold on
plot(x(neg, 2), x(neg, 3), 'o'); hold on
xlabel('Exam 1 score')
ylabel('Exam 2 score')
% ����sigmod ����

g = @(z) 1.0 ./ (1.0 + exp(-z));
% �÷�: Ҫ�ҳ�2��sigmodֵ������g(2)
% ��������������������������������ÿ��Ԫ�ص�sigmod
% ţ�ٷ�
MAX_ITR = 20;   % ����������
J = zeros(MAX_ITR, 1); % ����ÿ�ε�������ʧ
theta = zeros(n, 1); % ��ʼ��ѵ������


for i = 1:MAX_ITR
    h = g(x*theta);   % ������躯��,�õ�һ����������ÿ��Ϊ�Ǹ���������1�ĸ���
    J(i) = (1/m) * sum(-y.*log(h) - (1-y).*log(1-h)); % ������ʧ����
    % �����ݶȺͺ�ɭ����
    grad = (1/m) .* x' * (h - y); %����J��theta��һ�׵�
    % �Լ��뵽��ʵ��
    H = (1/m) .* x' * (repmat(h .* (1-h), 1, n) .* x);  %���㺣ɭ���󣬼�J��theta�Ķ��׵�
    theta = theta - H\grad;
    % Solution�е�ʵ��
    % H = (1/m).*x'*diag(h)*diag(1-h)*x;
    % theta = theta - H\grad; % �����inv(H)*gradһ��
end
% Display theta
theta

% prediction
fprintf(['Probability that a student with a escore of exam 1 20 and 80 on exam 2 \n' ...
    'will not be admitted to college is %f\n'], 1 - g([1 20 80]*theta));



% ����ţ�ٷ������
% ���߽߱磺theta(1)*1+theta(2)*x2 + theta(3)*x3=0
% ����ȷ��һ��ֱ�ߣ�����ѡ��x2ά���ϵ����㣬
plot_x = [min(x(:,2))-2, max(x(:,2))+2];
% �����Ӧ��x3ֵ
plot_y = (-1./theta(3)).*(theta(2).*plot_x+theta(1));
% ��ֱ��
plot(plot_x, plot_y)
legend('Admitted', 'Not admitted', 'Decision Boundary')
hold off

% ����J
figure
plot(0:MAX_ITR-1, J, 'o--', 'MarkerFaceColor', 'r', 'MarkerSize', 8)
xlabel('Iteration'); ylabel('J')
J

% ���ݶ��½����Ա�
MAX_ITR = 20;   % ����������
J = zeros(MAX_ITR, 1); % ����ÿ�ε�������ʧ
theta = zeros(n, 1); % ��ʼ��ѵ������
alpha = 0.01;
for i = 1:MAX_ITR
    h = g(x*theta);   % ������躯��,�õ�һ����������ÿ��Ϊ�Ǹ���������1�ĸ���
    J(i) = (1/m) * sum(-y.*log(h) - (1-y).*log(1-h)); % ������ʧ����
    % �����ݶ�
    grad = (1/m) .* x' * (h - y); %����J��theta��һ�׵�
    theta = theta - alpha*grad;
end
% Display theta
theta
hold on
plot(0:MAX_ITR-1, J, '*--', 'MarkerFaceColor', 'r', 'MarkerSize', 8)
legend('newton', 'gradient descent')
