% SPR_response_curve.m
%
% BK7/BaTiO3/Ag/BP SPR biosensor
%
% Calculates:
%   1. Resonance angle of healthy and cancerous cells
%   2. Angular shift Delta_theta_SPR
%   3. Sensitivity S
%   4. Half-depth level
%   5. FWHM from cancerous SPR curve
%   6. Quality factor QF
%   7. Detection accuracy DA
%
% The FWHM calculation follows the manual procedure:
%
% R_half = (R_max + R_min_cancer)/2
%
% where R_max = 1.
%
% FWHM = theta_right - theta_left

clear;
clc;
close all;

%% ============================================================
%  FIXED PARAMETERS
% =============================================================

lambda = 633e-9;                    % wavelength (m)

theta_deg = 65:0.01:90;             % angle sweep
theta1 = deg2rad(theta_deg);

% Prism
n1 = 1.5151;

% BaTiO3
n2 = 2.4042;
d2 = 35e-9;

% Silver
n3 = 0.0563 + 4.276i;
d3 = 50e-9;

% Black phosphorus
n4 = 3.5 - 0.01i;
d4 = 5 * 0.53e-9;

%% ============================================================
%  CANCER CELL DATA
% =============================================================

cellNames = { ...
    'Basal (Skin)', ...
    'HeLa (Cervical)', ...
    'Jurkat (Blood)', ...
    'PC-12 (Adrenal)', ...
    'MDA-MB-231 (Breast I)', ...
    'MCF-7 (Breast II)'};

% Healthy refractive indices
n5_healthy = [ ...
    1.360, ...
    1.368, ...
    1.376, ...
    1.381, ...
    1.385, ...
    1.387];

% Cancerous refractive indices
n5_cancer = [ ...
    1.380, ...
    1.392, ...
    1.390, ...
    1.395, ...
    1.399, ...
    1.401];

%% ============================================================
%  CREATE FIGURE
% =============================================================

figure('Color','w','Position',[100 50 1200 850]);

%% ============================================================
%  STORAGE FOR RESULTS
% =============================================================

theta_H_all = zeros(1,6);
theta_C_all = zeros(1,6);

delta_theta_all = zeros(1,6);
delta_n_all = zeros(1,6);

Rmin_all = zeros(1,6);
Rhalf_all = zeros(1,6);

theta_left_all = zeros(1,6);
theta_right_all = zeros(1,6);

FWHM_all = zeros(1,6);

S_all = zeros(1,6);
QF_all = zeros(1,6);
DA_all = zeros(1,6);

%% ============================================================
%  LOOP THROUGH SIX CELL TYPES
% =============================================================

for k = 1:6

    %% --------------------------------------------------------
    % Calculate reflectance
    % ---------------------------------------------------------

    R_healthy = reflectance( ...
        theta1, lambda, ...
        n1, n2, d2, ...
        n3, d3, ...
        n4, d4, ...
        n5_healthy(k));

    R_cancer = reflectance( ...
        theta1, lambda, ...
        n1, n2, d2, ...
        n3, d3, ...
        n4, d4, ...
        n5_cancer(k));

    %% --------------------------------------------------------
    % 1. Find resonance angle of healthy cell
    % ---------------------------------------------------------

    [Rmin_H, idx_H] = min(R_healthy);

    theta_H = theta_deg(idx_H);

    %% --------------------------------------------------------
    % 2. Find resonance angle of cancerous cell
    % ---------------------------------------------------------

    [Rmin_C, idx_C] = min(R_cancer);

    theta_C = theta_deg(idx_C);

    %% --------------------------------------------------------
    % 3. Angular shift
    % ---------------------------------------------------------

    delta_theta = abs(theta_C - theta_H);

    %% --------------------------------------------------------
    % 4. Refractive-index change
    % ---------------------------------------------------------

    delta_n = n5_cancer(k) - n5_healthy(k);

    %% --------------------------------------------------------
    % 5. Sensitivity
    %
    % S = Delta_theta / Delta_n
    % ---------------------------------------------------------

    S = delta_theta / delta_n;

    %% --------------------------------------------------------
    % 6. Calculate half-depth level
    %
    % Maximum reflectance is taken as 1.
    %
    % R_half = (1 + Rmin_cancer)/2
    % ---------------------------------------------------------

    Rmax = 1;

    Rhalf = (Rmax + Rmin_C) / 2;

    %% --------------------------------------------------------
    % 7. Find intersections of cancerous curve with R_half
    % ---------------------------------------------------------

    % Difference between cancer curve and horizontal line
    difference = R_cancer - Rhalf;

    % Find all locations where the sign changes
    crossing_indices = find( ...
        difference(1:end-1) .* difference(2:end) <= 0);

    % We expect two crossings around the resonance.
    % Use the crossings surrounding the cancerous resonance.
    %
    % Find the crossing immediately before resonance
    % and immediately after resonance.

    left_candidates = crossing_indices( ...
        crossing_indices < idx_C);

    right_candidates = crossing_indices( ...
        crossing_indices >= idx_C);

    if isempty(left_candidates) || isempty(right_candidates)

        warning('Could not determine FWHM for %s.', cellNames{k});

        theta_left = NaN;
        theta_right = NaN;
        FWHM = NaN;

    else

        % Last crossing before resonance
        idx_left = left_candidates(end);

        % First crossing after resonance
        idx_right = right_candidates(1);

        %% ----------------------------------------------------
        % Linear interpolation for more accurate intersection
        % -----------------------------------------------------

        % LEFT intersection
        x1 = theta_deg(idx_left);
        x2 = theta_deg(idx_left + 1);

        y1 = difference(idx_left);
        y2 = difference(idx_left + 1);

        theta_left = x1 - y1 * (x2 - x1) / (y2 - y1);

        % RIGHT intersection
        x1 = theta_deg(idx_right);
        x2 = theta_deg(idx_right + 1);

        y1 = difference(idx_right);
        y2 = difference(idx_right + 1);

        theta_right = x1 - y1 * (x2 - x1) / (y2 - y1);

        %% ----------------------------------------------------
        % FWHM
        % -----------------------------------------------------

        FWHM = theta_right - theta_left;

    end

    %% --------------------------------------------------------
    % 8. Quality Factor
    %
    % QF = S / FWHM
    % ---------------------------------------------------------

    QF = S / FWHM;

    %% --------------------------------------------------------
    % 9. Detection Accuracy
    %
    % DA = Delta_theta / FWHM
    % ---------------------------------------------------------

    DA = delta_theta / FWHM;

    %% ========================================================
    % STORE RESULTS
    % =========================================================

    theta_H_all(k) = theta_H;
    theta_C_all(k) = theta_C;

    delta_theta_all(k) = delta_theta;
    delta_n_all(k) = delta_n;

    Rmin_all(k) = Rmin_C;
    Rhalf_all(k) = Rhalf;

    theta_left_all(k) = theta_left;
    theta_right_all(k) = theta_right;

    FWHM_all(k) = FWHM;

    S_all(k) = S;
    QF_all(k) = QF;
    DA_all(k) = DA;

    %% ========================================================
    % PLOT
    % =========================================================

    subplot(3,2,k);

    plot(theta_deg, R_healthy, ...
        'b-', 'LineWidth', 1.5);
    hold on;

    plot(theta_deg, R_cancer, ...
        'r-', 'LineWidth', 1.5);

    %% --------------------------------------------------------
    % Draw horizontal half-depth line
    % ---------------------------------------------------------

    plot([theta_left theta_right], ...
         [Rhalf Rhalf], ...
         'k--', 'LineWidth', 1.0);

    %% --------------------------------------------------------
    % Mark the two FWHM points
    % ---------------------------------------------------------

    plot(theta_left, Rhalf, ...
        'ko', ...
        'MarkerFaceColor','k', ...
        'MarkerSize',5);

    plot(theta_right, Rhalf, ...
        'ko', ...
        'MarkerFaceColor','k', ...
        'MarkerSize',5);

    %% --------------------------------------------------------
    % Mark healthy resonance
    % ---------------------------------------------------------

    plot(theta_H, Rmin_H, ...
        'ko', ...
        'MarkerFaceColor','b', ...
        'MarkerSize',5);

    %% --------------------------------------------------------
    % Mark cancerous resonance
    % ---------------------------------------------------------

    plot(theta_C, Rmin_C, ...
        'ko', ...
        'MarkerFaceColor','r', ...
        'MarkerSize',5);

    %% --------------------------------------------------------
    % Axis and title
    % ---------------------------------------------------------

    xlabel('Angle of Incidence (degree)');
    ylabel('Reflectance (a.u.)');

    title(cellNames{k});

    legend('Healthy', ...
           'Cancerous', ...
           'FWHM level', ...
           'Location','southeast');

    xlim([65 90]);
    ylim([0 1]);

    grid on;

    %% ========================================================
    % ANNOTATION
    % =========================================================

    annotation_text = sprintf([ ...
        '%s Cell:\n' ...
        'S = %.2f (°/RIU)\n' ...
        'FWHM = %.2f°\n' ...
        'QF = %.2f (RIU^{-1})\n' ...
        'DA = %.2f\n' ...
        'n_H = %.3f\n' ...
        'n_C = %.3f'], ...
        cellNames{k}, ...
        S, ...
        FWHM, ...
        QF, ...
        DA, ...
        n5_healthy(k), ...
        n5_cancer(k));

    text(66, 0.78, ...
        annotation_text, ...
        'FontSize',8, ...
        'VerticalAlignment','top');

end

%% ============================================================
%  OVERALL TITLE
% =============================================================

sgtitle('SPR Response Curves for Six Cancer Cell Types');

%% ============================================================
%  DISPLAY RESULTS IN COMMAND WINDOW
% =============================================================

fprintf('\n');
fprintf('============================================================\n');
fprintf('        SPR BIOSENSOR PERFORMANCE PARAMETERS\n');
fprintf('============================================================\n');

fprintf('%-22s %8s %8s %8s %8s %8s\n', ...
    'Cell', 'dTheta', 'FWHM', 'S', 'QF', 'DA');

fprintf('------------------------------------------------------------\n');

for k = 1:6

    fprintf('%-22s %8.3f %8.3f %8.2f %8.2f %8.2f\n', ...
        cellNames{k}, ...
        delta_theta_all(k), ...
        FWHM_all(k), ...
        S_all(k), ...
        QF_all(k), ...
        DA_all(k));

end

fprintf('============================================================\n');


%% ============================================================
%  TRANSFER MATRIX REFLECTANCE FUNCTION
% =============================================================

function R = reflectance(theta1, lambda, ...
                          n1, n2, d2, ...
                          n3, d3, ...
                          n4, d4, ...
                          n5)

    % ---------------------------------------------------------
    % Dielectric constants
    % ---------------------------------------------------------

    e1 = n1^2;
    e2 = n2^2;
    e3 = n3^2;
    e4 = n4^2;
    e5 = n5^2;

    % ---------------------------------------------------------
    % In-plane wavevector term
    % ---------------------------------------------------------

    kx2 = (n1 * sin(theta1)).^2;

    % ---------------------------------------------------------
    % Optical admittance
    % gamma_j = sqrt(e_j - kx2) / e_j
    % ---------------------------------------------------------

    gamma1 = sqrt(e1 - kx2) ./ e1;
    gamma2 = sqrt(e2 - kx2) ./ e2;
    gamma3 = sqrt(e3 - kx2) ./ e3;
    gamma4 = sqrt(e4 - kx2) ./ e4;
    gamma5 = sqrt(e5 - kx2) ./ e5;

    % ---------------------------------------------------------
    % Phase thickness
    % ---------------------------------------------------------

    delta2 = (2*pi/lambda) * d2 .* sqrt(e2 - kx2);
    delta3 = (2*pi/lambda) * d3 .* sqrt(e3 - kx2);
    delta4 = (2*pi/lambda) * d4 .* sqrt(e4 - kx2);

    % ---------------------------------------------------------
    % Interface reflection coefficients
    % ---------------------------------------------------------

    rho12 = (gamma1 - gamma2) ./ (gamma1 + gamma2);
    rho23 = (gamma2 - gamma3) ./ (gamma2 + gamma3);
    rho34 = (gamma3 - gamma4) ./ (gamma3 + gamma4);
    rho45 = (gamma4 - gamma5) ./ (gamma4 + gamma5);

    % ---------------------------------------------------------
    % Recursive combination
    % ---------------------------------------------------------

    rho345 = ...
        (rho34 + rho45 .* exp(2i*delta4)) ./ ...
        (1 + rho34 .* rho45 .* exp(2i*delta4));

    rho2345 = ...
        (rho23 + rho345 .* exp(2i*delta3)) ./ ...
        (1 + rho23 .* rho345 .* exp(2i*delta3));

    rho = ...
        (rho12 + rho2345 .* exp(2i*delta2)) ./ ...
        (1 + rho12 .* rho2345 .* exp(2i*delta2));

    % ---------------------------------------------------------
    % Reflectance
    % ---------------------------------------------------------

    R = abs(rho).^2;

end