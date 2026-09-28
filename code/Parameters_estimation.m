%% Known quantities

Va_n = 600;
w_n = 314;
v_n = 60*1000/3600;
n = 0.9;
tau_a = 10*10^-3;
Ve_n = 120;
Ie_n = 1;
tau_e = 1;

M = 10*10^3+80*200;
t_fin = 25;
v_fin = v_n;
g = 9.81;
%% Computation of model parameters
tau_m = -t_fin/log(1-1/3);
betha = M/tau_m;
Ft_n = 3*M*v_fin/tau_m;
Pn = Ft_n*v_n;
Ptot = Pn/n;
Ia_n = (Ptot-Ve_n*Ie_n)/Va_n;
Ra = (Va_n*Ia_n-Pn)/(Ia_n^2);
La = tau_a*Ra;
Re = Ve_n/Ie_n;
Le = tau_e*Re;
Ke = Pn/(Ie_n*Ia_n*w_n);

R = v_n/w_n;
T_n = Ft_n * R;

ome_b = (Va_n-Ra*Ia_n)/Ke;

%s = tf('s');
%F = (Ft_n/M)/(s+betha/M);
%step(F)

%% Known transfer fuctions:
% Mechanical T.F.
mu_m = 1/(R^2*betha);
tau_m = M/betha;

% Armature circuit
mu_Ia = 1/Ra;
tau_Ia = La/Ra;

%Excitation circuit
mu_Ie = 1/Re;
tau_Ie = Le/Re;


%Required cutting frequencies for the loops

wc_ome = 5/(t_fin-20);
wc_Ia = 100;
wc_Ie = 10; % 


%% Save of parameters

save('Radius.mat', 'R');
save('psi_ref_parameters', 'Ie_n','ome_b','Ke','Va_n','Ra','Ia_n')