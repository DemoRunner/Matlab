function theta=normal_equation(X,Y)
c=ones(100,1);%����100��ȫΪ1��������
X=[c X];%һ����������һ��
theta=(inv(X'*X))*X'*Y;
end