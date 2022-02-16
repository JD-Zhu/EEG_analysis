% Plots the topography of each frequency band &
% saves the figures into the specified location
%
% @freq             output struct from ft_freqanalysis or ft_freqgrandaverage
% @lay              channel layout
% @freq_band        string, e.g. 'theta'
% @freq_range       e.g. [4 8]
% @zlim             axis lims for t-values, e.g. [0 3]
% @save_location    where to save the figures (optional).
%                   if you don't want to save, just specify as ''
%
% Author: Judy Zhu (github.com/JD-Zhu)
%
function plot_TFR_topo(freq, lay, freq_band, freq_range, zlim, save_location)

    cfg = [];
    cfg.xlim         = freq_range; % freq range to plot (NOTE this is diff from FT documentation, as we only have 2 dimensions in "freq", ie. not TFR)
    cfg.zlim         = zlim;
    cfg.marker       = 'on';
    cfg.style        = 'straight'; % 'both';
    cfg.colorbar     = 'yes';
    %cfg.comment      = 'xlim'; % display date & freq range
    cfg.comment      = 'no';
    cfg.layout       = lay;
    cfg.dataname     = freq_band; % display this in the figure window title bar
    ft_topoplotTFR(cfg, freq); 

    if ~strcmp(save_location, '')
        %saveas(gcf, [save_location freq_band '.png']); % this fn does not maintain the aspect ratio, font size, etc
        export_fig(gcf, [save_location freq_band '.png']); % use this tool to save the figure exactly as shown on screen
    end
end