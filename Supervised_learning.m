x = load('data\ex2x.dat'); % x����������,��һ��������
y = load('data\ex2y.dat'); % y��������ߣ�Ҳ��һ��������

figure % ���µĻ滭����
plot(x, y, 'o');
ylabel('Height in meters');
xlabel('Age in years');
m = length(y);  % m�洢������Ŀ
x = [ones(m, 1), x]; % ��x��ӵ�һ��ȫΪ1,����x��ÿһ����2��������ʾÿ���������������ڶ��в�����������
theta = zeros(2, 1); % thetaΪȨ�ز�����һ��2ά����������ʼ��Ϊ0
alpha = 0.07; %����
MAX_ITR = 1500; %����������
ERROR = 1e-10;
% Batch gradient decent
for i=1:MAX_ITR
    % Jtheta = 0.07/m*sum(x*theta-y).^2); �������
    grad = 1/m*x'*(x*theta-y); %�����ݶ�
    prev_theta = theta;
    theta = theta - alpha*grad; 
    if abs(prev_theta-theta)<ERROR
        break
    end
    fprintf('%d\n',i);%��¼�����˶��ٴ�
end
%��ʾ����õ���theta;
theta; 
%�������ߣ��Ʋ�����
[1 3.5]*theta;
[1 7]*theta;
hold on % Plot new data without clearing old plot
plot(x(:,2), x*theta, '-'); % remember that x is now a matrix with 2 columns
                            % and the second column contains the time info
legend('Training data', 'Linear regression');