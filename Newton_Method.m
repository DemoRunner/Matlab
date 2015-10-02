function theta=Newton_Method(x,y)

[m,n]=size(x);

x = [ones(m,1), x];  %����ƫ����1����һ��

MAX_ITR = 20;   % ����������
J = zeros(MAX_ITR, 1); % ����ÿ�ε�������ʧ
theta = zeros(n+1, 1); % ��ʼ��ѵ������


for i = 1:MAX_ITR   
    
    h=x*theta;
%     J(i) = (1/2) .* sum((h-y).^2); % ������ʧ����
%     % �����ݶȺͺ�ɭ����
     grad = x' * (h - y); %����J��theta��һ�׵�
%     % �Լ��뵽��ʵ��
     H = x'*x;  %���㺣ɭ���󣬼�J��theta�Ķ��׵�
%     theta = theta - inv(H)*grad;
    % Solution�е�ʵ��
    %H = x'*diag(h)*diag(1-h)*x;
    %theta = theta - inv(H)*grad;
    theta = theta - H\grad; % �����inv(H)*gradһ��
end
end