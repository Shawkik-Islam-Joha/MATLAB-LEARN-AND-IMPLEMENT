% SPR_response_curve.m
%
% Reflectance vs. Angle of Incidence for the BK7/BaTiO3/Ag/BP SPR
% biosensor (Saha et al., Sensors & Actuators A: Physical, 396 (2025) 117121).
%
% Reproduces Fig. 6: healthy vs. cancerous reflectance curves for six
% cancer cell types, using the recursive 5-layer Transfer Matrix Method
% (TMM) given in the Supplementary Document, Eqs. (s1)-(s10).
%
% Layer stack (Table 1 of the paper):
%   1: BK7 prism        (incident medium, semi-infinite)
%   2: BaTiO3            35 nm
%   3: Ag                50 nm
%   4: BP                 5 layers x 0.53 nm = 2.65 nm
%   5: Sensing medium    (cancer cell, semi-infinite)

clear; clc; close all;

%% Fixed parameters (Table 1)
lambda = 633e-9;              % wavelength (m)
theta_deg = 65:0.01:90;       % angle-of-incidence sweep (deg), matches Fig. 6
theta1 = deg2rad(theta_deg);

n1 = 1.5151;                  % BK7 prism
n2 = 2.4042;  d2 = 35e-9;     % BaTiO3
n3 = 0.0563 + 4.276i; d3 = 50e-9;   % Ag (Johnson & Christy)
n4 = 3.5 - 0.01i;  d4 = 5 * 0.53e-9;  % BP, 5 layers

% Sensing-medium RI: healthy / cancerous (Table 2)
cellNames  = {'Basal (Skin)','HeLa (Cervical)','Jurkat (Blood)', ...
              'PC-12 (Adrenal)','MDA-MB-231 (Breast I)','MCF-7 (Breast II)'};
n5_healthy = [1.360 1.368 1.376 1.381 1.385 1.387];
n5_cancer  = [1.380 1.392 1.390 1.395 1.399 1.401];

%% Plot all six cell types
figure('Color','w','Position',[100 100 1000 700]);

for k = 1:6
    R_healthy = reflectance(theta1, lambda, n1, n2, d2, n3, d3, n4, d4, n5_healthy(k));
    R_cancer  = reflectance(theta1, lambda, n1, n2, d2, n3, d3, n4, d4, n5_cancer(k));

    subplot(3, 2, k);
    plot(theta_deg, R_healthy, 'b-', 'LineWidth', 1.5); hold on;
    plot(theta_deg, R_cancer,  'r-', 'LineWidth', 1.5);
    xlabel('Angle of Incidence (degree)');
    ylabel('Reflectance (a.u.)');
    title(cellNames{k});
    legend('Healthy','Cancerous','Location','southwest');
    xlim([65 90]); ylim([0 1]);
    grid on;
end

sgtitle('SPR Response Curves for Six Cancer Cell Types (TMM, Eqs. s1-s10)');

%% ---- Local function: reflectance via recursive 5-layer TMM ----
function R = reflectance(theta1, lambda, n1, n2, d2, n3, d3, n4, d4, n5)
    % Dielectric constants of each layer
    e1 = n1^2; e2 = n2^2; e3 = n3^2; e4 = n4^2; e5 = n5^2;

    % In-plane wavevector term, common to all layers: eta1^2 * sin^2(theta1)
    kx2 = (n1 * sin(theta1)).^2;

    % Optical admittance of each layer, Eq. (s5): gamma_j = sqrt(e_j - kx2)/e_j
    gamma1 = sqrt(e1 - kx2) / e1;
    gamma2 = sqrt(e2 - kx2) / e2;
    gamma3 = sqrt(e3 - kx2) / e3;
    gamma4 = sqrt(e4 - kx2) / e4;
    gamma5 = sqrt(e5 - kx2) / e5;

    % Phase thickness of each finite layer, Eq. (s4)
    delta2 = (2*pi/lambda) * d2 * sqrt(e2 - kx2);
    delta3 = (2*pi/lambda) * d3 * sqrt(e3 - kx2);
    delta4 = (2*pi/lambda) * d4 * sqrt(e4 - kx2);

    % Interface reflection coefficients, Eq. (s10): rho_ij = (g_i-g_j)/(g_i+g_j)
    rho12 = (gamma1 - gamma2) ./ (gamma1 + gamma2);
    rho23 = (gamma2 - gamma3) ./ (gamma2 + gamma3);
    rho34 = (gamma3 - gamma4) ./ (gamma3 + gamma4);
    rho45 = (gamma4 - gamma5) ./ (gamma4 + gamma5);

    % Recursive combination from the innermost interface outward, Eqs. (s9)-(s8)
    rho345  = (rho34 + rho45  .* exp(2i*delta4)) ./ (1 + rho34.*rho45  .* exp(2i*delta4));
    rho2345 = (rho23 + rho345 .* exp(2i*delta3)) ./ (1 + rho23.*rho345 .* exp(2i*delta3));
    rho     = (rho12 + rho2345.* exp(2i*delta2)) ./ (1 + rho12.*rho2345.* exp(2i*delta2));

    R = abs(rho).^2;
end
