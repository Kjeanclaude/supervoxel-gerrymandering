function SVXGRM( demo_input )
% Take directory information and runs supervoxel-based gerrymandering
% algorithm on images from video.

% Add primary code path.
addpath('./code');
% Initiate primary algorithm variables and data paths.
seg = dataPathAndSettings(demo_input); 

for i=1:length(seg.path.data_list)
    fprintf('\nPerforming video object segmentation for %s.\n',seg.path.data_list{i});
    seg.cur.data_i = i;
    % Low-level processing.
    seg = lowLevel(seg);
    % Mid-level processing.
    seg = midLevel(seg);
    % Foreground Segmentation.
    seg = foregroundSeg(seg);
    % Save Output Mask / Video.
    segmentationOutput(seg);
    % Clear video-specific data.
    seg.cur = 0; fprintf('\n'); 
end

end