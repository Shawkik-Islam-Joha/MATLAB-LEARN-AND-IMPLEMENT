% Figure2_and_Figure3.m
%
% Reproduces Fig. 2 (a)-(d) and Fig. 3 (a)-(c) of:
%   Saha et al., "A high-performance BaTiO3/Ag/BP-based plasmonic
%   biosensor...", Sensors & Actuators A: Physical, 396 (2025) 117121.
%
% Method: general N-layer Transfer Matrix Method (TMM), built directly
% from the supplementary PDF equations (s3)-(s7):
%   Eq. (s5)  -> optical admittance of each layer (gamma)
%   Eq. (s4)  -> phase thickness of each finite layer (delta)
%   Eq. (s3)  -> 2x2 transfer matrix of each finite layer
%   Eq. (s6)  -> cascaded total transfer matrix
%   Eq. (s7)  -> reflection coefficient from the total matrix
%   Eq. (3, main paper) -> R = |rho|^2
%
% Unlike the 5-layer-only recursive shortcut (Eqs. s8-s10) used for
% Fig. 6, this function works for ANY number of layers, so the same
% code reproduces the 3-layer (Ag only), 4-layer (BaTiO3/Ag), and
% 5-layer (BaTiO3/Ag/BP) structures used in Fig. 2 and Fig. 3.

clear; clc; close all;

%% ======================= LOCAL FUNCTIONS ==============================
% (defined here, before use, so this script also runs unmodified in GNU Octave)

function R = tmm_reflectance(theta1, lambda, n, d)
    % General N-layer reflectance via the cascaded transfer matrix method.
    % n : 1 x L vector of refractive indices, n(1) = prism, n(L) = analyte
    % d : 1 x (L-2) vector of thicknesses (m) of the intermediate layers
    % theta1 : vector of incidence angles (rad), inside the prism
    % Implements supplementary Eqs. (s3)-(s7).

    eps_r = n.^2;
    L = length(n);
    R = zeros(size(theta1));

    for t = 1:length(theta1)
        kx2 = (n(1) * sin(theta1(t)))^2;          % common in-plane term
        gamma = sqrt(eps_r - kx2) ./ eps_r;        % Eq. (s5), all layers

        T = eye(2);
        for j = 2:L-1                              % only finite (intermediate) layers
            delta = (2*pi/lambda) * d(j-1) * sqrt(eps_r(j) - kx2);   % Eq. (s4)
            Tj = [cos(delta), -1i*sin(delta)/gamma(j); ...
                  -1i*gamma(j)*sin(delta), cos(delta)];               % Eq. (s3)
            T = T * Tj;                                               % Eq. (s6)
        end

        g1 = gamma(1); gL = gamma(L);
        rho = ((T(1,1) + T(1,2)*gL)*g1 - (T(2,1) + T(2,2)*gL)) / ...
              ((T(1,1) + T(1,2)*gL)*g1 + (T(2,1) + T(2,2)*gL));       % Eq. (s7)
        R(t) = abs(rho)^2;
    end
end

function [theta_res, FWHM, Rmin] = resonanceMetrics(theta_deg, R)
    % Finds the resonance angle, FWHM, and minimum reflectance of a dip.
    [Rmin, idx] = min(R);
    theta_res = theta_deg(idx);
    half = (max(R) + Rmin) / 2;

    iL = find(R(1:idx) >= half, 1, 'last');
    iR = idx - 1 + find(R(idx:end) >= half, 1, 'first');

    if isempty(iL) || isempty(iR) || iR <= iL
        FWHM = NaN;             % dip too close to the sweep edge to resolve
        return;
    end
    thetaL = interp1(R([iL iL+1]), theta_deg([iL iL+1]), half);
    thetaR = interp1(R([iR-1 iR]), theta_deg([iR-1 iR]), half);
    FWHM = thetaR - thetaL;
end

function [S, QF, Rmin_high] = sensitivityAndQF(theta_deg, R_low, R_high, eta_low, eta_high)
    % Sensitivity (Eq. 4), Quality Factor (Eq. 5), using the high-RI
    % curve's FWHM/minimum, exactly as reported throughout the paper.
    [th_low,  ~,     ~       ] = resonanceMetrics(theta_deg, R_low);
    [th_high, FWHM, Rmin_high] = resonanceMetrics(theta_deg, R_high);
    S  = (th_high - th_low) / (eta_high - eta_low);
    QF = S / FWHM;
end

%% Fixed material parameters (Table 1, main paper)
lambda   = 633e-9;            % wavelength (m)
n1       = 1.5151;            % BK7 prism
n_BaTiO3 = 2.4042;            % BaTiO3
n_Ag     = 0.0563 + 4.276i;   % Ag (Johnson & Christy)
n_BP     = 3.5 - 0.01i;       % BP (per layer)
t_BP1    = 0.53e-9;           % thickness of ONE BP layer

eta_low  = 1.360;             % reference RI (used throughout the paper)
eta_high = 1.401;             % reference RI (used throughout the paper)

theta_deg = 60:0.01:90;       % angle-of-incidence sweep (deg), matches Fig. 2/3
theta1    = deg2rad(theta_deg);

%% =====================================================================
%  FIGURE 2 : Ag only -> BaTiO3/Ag -> BaTiO3/Ag/BP  (baseline thicknesses)
%  Baseline thicknesses used in the paper for this comparison:
%  t_Ag = 40 nm, t_BaTiO3 = 10 nm, t_BP = 1 layer
%  =====================================================================

% (a) BK7 / Ag(40nm) / analyte
Ra_low  = tmm_reflectance(theta1, lambda, [n1 n_Ag eta_low],  40e-9);
Ra_high = tmm_reflectance(theta1, lambda, [n1 n_Ag eta_high], 40e-9);

% (b) BK7 / BaTiO3(10nm) / Ag(40nm) / analyte
Rb_low  = tmm_reflectance(theta1, lambda, [n1 n_BaTiO3 n_Ag eta_low],  [10e-9 40e-9]);
Rb_high = tmm_reflectance(theta1, lambda, [n1 n_BaTiO3 n_Ag eta_high], [10e-9 40e-9]);

% (c) BK7 / BaTiO3(10nm) / Ag(40nm) / BP(1 layer) / analyte
Rc_low  = tmm_reflectance(theta1, lambda, [n1 n_BaTiO3 n_Ag n_BP eta_low],  [10e-9 40e-9 t_BP1]);
Rc_high = tmm_reflectance(theta1, lambda, [n1 n_BaTiO3 n_Ag n_BP eta_high], [10e-9 40e-9 t_BP1]);

% Sensitivity and quality factor for each configuration (Eqs. 4-5, main paper)
[S_a, QF_a] = sensitivityAndQF(theta_deg, Ra_low, Ra_high, eta_low, eta_high);
[S_b, QF_b] = sensitivityAndQF(theta_deg, Rb_low, Rb_high, eta_low, eta_high);
[S_c, QF_c] = sensitivityAndQF(theta_deg, Rc_low, Rc_high, eta_low, eta_high);

figure('Color','w','Position',[100 100 950 750]);

subplot(2,2,1);
plot(theta_deg, Ra_low, 'b-', theta_deg, Ra_high, 'r-', 'LineWidth', 1.5);
xlabel('Angle of Incidence (degree)'); ylabel('Reflectance (a.u.)');
title('(a) Ag layer only'); legend('\eta_a = 1.360','\eta_a = 1.401','Location','northwest');
xlim([60 90]); ylim([0 1]); grid on;

subplot(2,2,2);
plot(theta_deg, Rb_low, 'b-', theta_deg, Rb_high, 'r-', 'LineWidth', 1.5);
xlabel('Angle of Incidence (degree)'); ylabel('Reflectance (a.u.)');
title('(b) BaTiO_3/Ag'); legend('\eta_a = 1.360','\eta_a = 1.401','Location','northwest');
xlim([60 90]); ylim([0 1]); grid on;

subplot(2,2,3);
plot(theta_deg, Rc_low, 'b-', theta_deg, Rc_high, 'r-', 'LineWidth', 1.5);
xlabel('Angle of Incidence (degree)'); ylabel('Reflectance (a.u.)');
title('(c) BaTiO_3/Ag/BP'); legend('\eta_a = 1.360','\eta_a = 1.401','Location','northwest');
xlim([60 90]); ylim([0 1]); grid on;

subplot(2,2,4);
yyaxis left
bar((1:3)-0.15, [S_a S_b S_c], 0.3); ylabel('Sensitivity (deg/RIU)');
yyaxis right
bar((1:3)+0.15, [QF_a QF_b QF_c], 0.3); ylabel('Quality Factor (RIU^{-1})');
set(gca, 'XTick', 1:3, 'XTickLabel', {'Ag','BaTiO_3/Ag','BaTiO_3/Ag/BP'});
title('(d) Sensitivity and QF comparison'); grid on;

sgtitle('Figure 2 reproduction: progressive biosensor configurations');

%% =====================================================================
%  FIGURE 3 : sequential parametric optimization
%  =====================================================================

% ---- (a) Ag thickness sweep: BK7/BaTiO3(10nm)/Ag(t)/BP(1L)/analyte ----
t_Ag_list = 35:5:65;                 % nm
S3a = zeros(size(t_Ag_list));
Rmin3a = zeros(size(t_Ag_list));

for k = 1:length(t_Ag_list)
    d = [10e-9, t_Ag_list(k)*1e-9, t_BP1];
    R_low  = tmm_reflectance(theta1, lambda, [n1 n_BaTiO3 n_Ag n_BP eta_low],  d);
    R_high = tmm_reflectance(theta1, lambda, [n1 n_BaTiO3 n_Ag n_BP eta_high], d);
    [S3a(k), ~, Rmin3a(k)] = sensitivityAndQF(theta_deg, R_low, R_high, eta_low, eta_high);
end
% (t_Ag = 50 nm gives the highest sensitivity / deepest dip -> used from here on)
t_Ag_opt = 50e-9;

% ---- (b) BaTiO3 thickness sweep: BK7/BaTiO3(t)/Ag(50nm)/BP(1L)/analyte ----
t_BaTiO3_list = 5:5:50;              % nm
S3b = zeros(size(t_BaTiO3_list));
QF3b = zeros(size(t_BaTiO3_list));

for k = 1:length(t_BaTiO3_list)
    d = [t_BaTiO3_list(k)*1e-9, t_Ag_opt, t_BP1];
    R_low  = tmm_reflectance(theta1, lambda, [n1 n_BaTiO3 n_Ag n_BP eta_low],  d);
    R_high = tmm_reflectance(theta1, lambda, [n1 n_BaTiO3 n_Ag n_BP eta_high], d);
    [S3b(k), QF3b(k)] = sensitivityAndQF(theta_deg, R_low, R_high, eta_low, eta_high);
end
% (t_BaTiO3 = 35 nm gives the best sensitivity/QF -> used from here on)
t_BaTiO3_opt = 35e-9;

% ---- (c) BP layer sweep: BK7/BaTiO3(35nm)/Ag(50nm)/BP(N)/analyte ----
N_BP_list = 1:6;
S3c = zeros(size(N_BP_list));
QF3c = zeros(size(N_BP_list));

for k = 1:length(N_BP_list)
    d = [t_BaTiO3_opt, t_Ag_opt, N_BP_list(k) * 0.53e-9];
    R_low  = tmm_reflectance(theta1, lambda, [n1 n_BaTiO3 n_Ag n_BP eta_low],  d);
    R_high = tmm_reflectance(theta1, lambda, [n1 n_BaTiO3 n_Ag n_BP eta_high], d);
    [S3c(k), QF3c(k)] = sensitivityAndQF(theta_deg, R_low, R_high, eta_low, eta_high);
end

figure('Color','w','Position',[100 100 950 750]);

subplot(2,2,1);
yyaxis left
plot(t_Ag_list, S3a, 'g-o', 'LineWidth', 1.5); ylabel('Sensitivity (deg/RIU)');
yyaxis right
plot(t_Ag_list, Rmin3a, 'r-o', 'LineWidth', 1.5); ylabel('Minimum Reflectance (a.u.)');
xlabel('Ag Thickness (nm)'); title('(a) Ag thickness optimization'); grid on;

subplot(2,2,2);
yyaxis left
plot(t_BaTiO3_list, S3b, 'g-o', 'LineWidth', 1.5); ylabel('Sensitivity (deg/RIU)');
yyaxis right
plot(t_BaTiO3_list, QF3b, 'm-o', 'LineWidth', 1.5); ylabel('Quality Factor (RIU^{-1})');
xlabel('BaTiO_3 Thickness (nm)'); title('(b) BaTiO_3 thickness optimization'); grid on;

subplot(2,2,[3 4]);
yyaxis left
plot(N_BP_list, S3c, 'g-o', 'LineWidth', 1.5); ylabel('Sensitivity (deg/RIU)');
yyaxis right
plot(N_BP_list, QF3c, 'm-o', 'LineWidth', 1.5); ylabel('Quality Factor (RIU^{-1})');
xlabel('Number of BP Layers'); title('(c) Number of BP layers optimization'); grid on;

sgtitle('Figure 3 reproduction: sequential layer-thickness optimization');
